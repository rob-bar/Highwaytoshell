ssh-env() {
  # Usage:
  # ssh-env prod
  # > Opens an SSH connection to the project's prod environment.
  #
  # Credentials are read from the project's "config/deploy/{env}.rb" file.
  #
  SSHUSER=$(get-ssh-user $1)
  SSHSERVER=$(get-ssh-server $1)
  ssh $SSHUSER@$SSHSERVER
}

get-ssh-user() {
  # Helper function to extract the SSH user from a specified config file.

  ROOT="$(git rev-parse --show-toplevel)"
  DEPLOYCONFIG="$ROOT/config/deploy/$1.rb"
  while IFS='' read -r line || [[ -n "$line" ]]; do
      if [[ $line == *"set :user"* ]]
      then
        SIZE=${#line}
        # TODO: replace "12" with proper string extraction.
        START="12"
        END=$(expr $SIZE - $START - 1)
        RESULT=${line:$START:$END}
        echo $RESULT
      fi
  done < "$DEPLOYCONFIG"
}

get-ssh-server() {
  # Helper function to extract the SSH server from a specified config file.

  ROOT="$(git rev-parse --show-toplevel)"
  DEPLOYCONFIG="$ROOT/config/deploy/$1.rb"
  while IFS='' read -r line || [[ -n "$line" ]]; do
      if [[ $line == *"server "* ]]
      then
        SIZE=${#line}
        # TODO: replace "15" with proper string extraction.
        START="8"
        END=$(expr $SIZE - $START - 1)
        RESULT=${line:$START:$END}
        RESULT=$(echo $RESULT|sed 's/\".*//')
        echo $RESULT
      fi
  done < "$DEPLOYCONFIG"
}
