gct() {
  # Like "git commit", but preformats your commit message with "Issue #{issue from branch name}: "
  # https://i.imgur.com/mCqvR6n.png
  # https://i.imgur.com/3s140Yc.png
  #
  # Requirements:
  # In order to have the cursor position after the pre-pended branch name,
  # add the following to your .profile (or .zprofile if you're using zshell):
  #
  # export GIT_EDITOR='vim +1 +star!'

  BRANCH="$(git rev-parse --abbrev-ref HEAD)"
  ISSUE="${BRANCH/issue-/}"
  # Create temporary file to store our commit message.
  touch $HOME/temp_commit_msg
  echo "Issue #$ISSUE: " > $HOME/temp_commit_msg
  # Commit using the temporary file as a template.
  git commit --template=$HOME/temp_commit_msg
  # Remove the temporary file.
  rm $HOME/temp_commit_msg
}

gac() {
  # Shorthand for adding all changes and committing it using a preformatted commit message.
  git add -A $1 && gct
}

git-clean() {
  # Remove all staged, unstaged & untracked changes in the current repo.
  ROOT="$(git rev-parse --show-toplevel)"
  git reset HEAD $ROOT
  git checkout -- $ROOT
  git clean -df $ROOT
}

issue() {
  # Usage:
  # issue WOL-55
  # Checks out the "issue-WOL-55" branch, or forks it from the prod branch
  # it if it doesn't yet exist.
  git checkout prod
  git pull
  git checkout issue-$1
  git checkout -b issue-$1
}

gmerge() {
  # Usage: gmerge -pj
  # Push the current branch and merge into master, staging & acc.
  # Options:
  # -p: merge into prod as well.
  # -j: open Jenkins.

  BRANCH="$(git rev-parse --abbrev-ref HEAD)"

  # Push the current branch. Cover for various push rejection scenarios
  # (no tracking info for current branch; unmerged remote commits; ...)
  git push
  git branch --set-upstream-to=origin/$BRANCH $BRANCH
  git pull --rebase
  git push

  # Trap errors, so script execution stops at the first error.
  trap "trap - ERR; return" ERR
  gmerge-from-to $BRANCH master
  gmerge-from-to $BRANCH staging
  gmerge-from-to $BRANCH acc
  git checkout $BRANCH
  while getopts 'pj' flag; do
    case "${flag}" in
      p) gmerge-from-to $BRANCH prod
         ;;
      j) jenkins
         ;;
    esac
  done

  # Cleanup.
  trap - ERR
}

gmerge-from-to () {
  # Helper function for gmerge.
  git checkout $2
  git pull --rebase
  git merge $1 -m "Merge $1 into $2"
  git push
}

jenkins() {
  open http://build-001.crosscheck.openminds.be
}
