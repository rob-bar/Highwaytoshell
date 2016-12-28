db-dump() {
  ############
  # Inspired by Kim Kennof.

  # Configuration: change the path of the backup folder to match your local setup.
  BACKUPFOLDER="/Users/robbiebardijn/Documents/TEMP/dumps"

  # Usage:
  # db-dump @myproject.prod
  # > Clears the Drupal cache and saves a gzipped DB dump in your specified backup folder in the format myproject_prod_<datetime>.sql.gz

  # Usage:
  # cd <projectroot>/docroot
  # db-dump
  # > Clears your local cache and saves a gzipped DB dump of your local site.
  ############

  # Trap errors, so script execution stops at the first error.
  trap "trap - ERR; return" ERR

  DBNAME="$(drush $1 status|grep "Database name"|sed 's/.*://'|tr -d '[[:space:]]')"
  DATE=$(date +%Y-%m-%d-%H.%M.%S)
  FILENAME=''
  if [ -n "$1" ]; then
      ALIASNAME="$(echo $1 | sed 's/@//' | sed 's/\./_/g')"
      FILENAME=$ALIASNAME'_'$DATE.sql.gz
  else
      FILENAME=$DBNAME'_'$DATE.sql.gz
  fi
  FILEPATH=$BACKUPFOLDER/$FILENAME
  if [ -n "$2" ]; then
      FILEPATH=$2
  fi
  echo "Attempting to dump $DBNAME at $FILEPATH"
  echo "Clearing cache..." && drush $1 cc all && echo "Dumping DB file..." && drush $1 sql-dump | gzip -9 > "$FILEPATH"

  # Cleanup.
  trap - ERR
}

sqlcgz() {
  ############
  # Usage:
  # cd <projectroot>/docroot
  # sqlcgz ~/Documents/Development\ files/Database\ backups/toerismewesthoek-2015-05-29-11.35.44.sql.gz
  # > Imports a gzipped DB dump file into your local Drupal site. The gzipped file will not be removed.
  ############

  trap "trap - ERR; return" ERR

  ACTUALFILE="$(echo $1| rev | cut -c 4- | rev)"
  echo "Unzipping..."
  gunzip -c $1 > $ACTUALFILE
  echo "Dropping local tables..."
  drush sql-drop -y
  echo "Importing..."
  drush sqlc < $ACTUALFILE && rm $ACTUALFILE
  echo "Done."

  # Cleanup.
  trap - ERR
}

db-sync() {
  ############
  # A concatenation of db-dump and sqlcgz.

  # Configuration: change the path of the backup folder to match your local setup.
  BACKUPFOLDER="/Users/robbiebardijn/Documents/TEMP/dumps"

  # Usage:
  # cd <projectroot>/docroot
  # db-sync @myproject.prod
  ############

  # Trap errors, so script execution stops at the first error.
  trap "trap - ERR; return" ERR

  DATE=$(date +%Y-%m-%d-%H.%M.%S)
  DBNAME="$(drush $1 status|grep "Database name"|sed 's/.*://'|tr -d '[[:space:]]')"

  FILENAME=''
  if [ -n "$1" ]; then
      ALIASNAME="$(echo $1 | sed 's/@//' | sed 's/\./_/g')"
      FILENAME=$ALIASNAME'_'$DATE.sql.gz
  else
      FILENAME=$DBNAME'_'$DATE.sql.gz
  fi
  FILEPATH=$BACKUPFOLDER/$FILENAME
  db-dump $1 $FILEPATH && sqlcgz $FILEPATH

  # Cleanup.
  trap - ERR
}
