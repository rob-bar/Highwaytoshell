find-replace() {
  # Inspired by Kim Kennof
  #
  # Requirements:
  # rename
  # (http://ss64.com/bash/rename.html)
  #
  # Usage:
  # find-replace faeture_typo feature_typo
  # find-replace "my cat rocks" "your cat sucks"
  #
  # > Finds all occurences of the first string (file names, directories & file contents)
  # and replaces it with the second string.
  # The search is recursive starting from the current directory.

  FILES=$(find . -type f -name '*')
  while read -r line; do
    if [ -n "${line}" ]; then
        perl -pi -w -e "s/$1/$2/g;" $line
        rename "s/$1/$2/g" $line -v
    fi
  done <<< "$FILES"
}
