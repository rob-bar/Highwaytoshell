drush-fua-overridden() {
  # Like "drush fua -y", but only recreates Features marked as "Overridden".
  INPUT=$(drush fl)
  FIRSTLINE=$(echo $INPUT|head -n1)
  BEGIN=${FIRSTLINE/Feature*/}
  BEGIN=$((${#BEGIN}-1))
  while read -r line; do
    if [ -n "${line}" ]; then
        if [[ $line == *"Overridden"* ]]
        then
          FEATURELINE=${line:$(echo $BEGIN)}
          FEATURENAME=${FEATURELINE/ */}
          drush fu $FEATURENAME -y
        fi
    fi
  done <<< "$INPUT"
}

drupal-update() {
  # Similar to most "update.sh" scripts, but can be run from anywhere in the Drupal
  # folder.
  # Pro tip: "db-sync @mysite.prod && drupal-update", then go get some coffee.

  # Trap errors, so script execution stops at the first error.
  trap "trap - ERR; return" ERR

  CORE=$(core-module-name)
  drush cc all
  drush en $CORE -y
  result=$(drush updb -y||tail -1)
  if [[ $result != *"cleared"* ]]
  then
    drush cc all
  fi
  drush fra -y
  drush env-switch local --force

  # Cleanup.
  trap - ERR
}

drupal-migrate() {
  drush migrate-deregister --orphans
  drush migrate-register
  drush mi --all --update
}

drupal-create-test-roles() {
  # Creates a test user for each available role. Name and password are the same as the role name.
  PROJECTNAME=$(basename `git rev-parse --show-toplevel`)
  ROLES=$(drush sql-query "SELECT name FROM role WHERE rid > 2"|sed 1d)
  while read -r line; do
    if [ -n "${line}" ]; then
        EXISTS=$(drush sql-query "SELECT uid FROM users WHERE name = '$line'")
        if [ -z "$EXISTS" ]
        then
          drush user-create $line --mail="test-$line@$PROJECTNAME.local" --password="$line" >/dev/null && drush user-add-role "$line" --name=$line >/dev/null && echo "User \"$line\" created with password \"$line\"."
        else
          drush upwd $line --password="$line" && drush user-add-role "$line" --name=$line >/dev/null && echo "User \"$line\" already exists. Password updated to \"$line\"."
        fi
    fi
  done <<< "$ROLES"
}

core-module-name() {
  # Helper function to extract the Drupal site's "core" module from the deploy config.

  ROOT="$(git rev-parse --show-toplevel)"
  DEPLOYCONFIG="$ROOT/config/deploy.rb"
  while IFS='' read -r line || [[ -n "$line" ]]; do
      if [[ $line == *"set :baseline"* ]]
      then
        SIZE=${#line}
        # TODO: replace "16" with proper string extraction.
        START="16"
        END=$(expr $SIZE - $START - 1)
        RESULT=${line:$START:$END}
        echo $RESULT
      fi
  done < "$DEPLOYCONFIG"
}