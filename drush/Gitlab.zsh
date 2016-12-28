# Open a commit from the current repo in Gitlab.
# Example usage: gl-open 7e402ce
gl-open () {
  GITPROJECT="$(git remote -v | head -n1 | awk '{print $2}' | sed 's/git@//' | sed 's/.git//' | sed 's/:/\//')"
  open http://$GITPROJECT/commit/$1
}

# Search for all commits that contain a specified string in the description
# and output them in a table-format which can be copy-pasted into a JIRA comment.
# This function is designed to make it easier for others to review your code.
#
# Argument 1: the string to search for.
# Argument 2 (optional): the author.
# Example usage: gl-grep CE-15 algeron
# Example output: https://i.imgur.com/7WjmFKH.png
# When copy-pasted into a JIRA comment: https://i.imgur.com/mwyNV6D.png
gl-grep () {
  GITPROJECT="$(git remote -v | head -n1 | awk '{print $2}' | sed 's/git@//' | sed 's/.git//' | sed 's/:/\//')"
  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  BRANCHLINK="http://$GITPROJECT/commits/$BRANCH"
  COMMITS="$(git log --format=%h --grep=$1 --author=$2)"
  if [ -n "${COMMITS}" ]; then
    echo ""
    echo "\\\\\\"
    echo "_Branch_: [$BRANCH|$BRANCHLINK]"
    echo "||Commit||Date||Description||"
  fi
  while read -r line; do
    if [ -n "${line}" ]; then
        DESCRIPTION="$(git log --format=%B -n 1 $line)"
        DATE="$(git log --format=%ad -n 1 $line)"
        # Strip the timezone information at the end of the date.
        DATE=${DATE%?}
        DATE=${DATE%?}
        DATE=${DATE%?}
        DATE=${DATE%?}
        DATE=${DATE%?}
        DATE=_~${DATE%?}~_

        echo "|[$line|http://$GITPROJECT/commit/$line]|$DATE|~$DESCRIPTION~|"
    fi
  done <<< "$COMMITS"
}

# A combination of gl-grep and gl-open.
#
# Argument 1: the string to search for.
# Argument 2 (optional): the author.
# Example usage: gl-grep-open CE-15 algeron
gl-grep-open () {
  GITPROJECT="$(git remote -v | head -n1 | awk '{print $2}' | sed 's/git@//' | sed 's/.git//' | sed 's/:/\//')"
  COMMITS="$(git log --format=%h --grep=$1 --author=$2)"
  while read -r line; do
    if [ -n "${line}" ]; then
        open "http://$GITPROJECT/commit/$line" && sleep 1
    fi
  done <<< "$COMMITS"
}
