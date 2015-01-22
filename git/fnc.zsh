function cleangit () {
  find . -name "*.git*" -print0 | xargs -0 rm -rf;
}

function cleancached () {
cat .gitignore | egrep -v "^#|^$" | while read line; do
  if [ -n "$line" ]; then
    OLD_IFS=$IFS; IFS=""
    for ignored_file in $( git ls-files "$line" ); do
      git rm --cached "$ignored_file"
    done
    IFS=$OLD_IFS
  fi
done
}

function gcmb: () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "$branch_name: $1";
}
