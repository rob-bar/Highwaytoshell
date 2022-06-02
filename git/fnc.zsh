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

function gplob () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gpl origin "$branch_name";
}

function gcmb: () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "$branch_name: $1";
}

function gcmfeat () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "Feat (${branch_name}): $1";
}

function gcmdoc () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "Doc (${branch_name}): $1";
}

function gcmfix () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "Fix (${branch_name}): $1";
}

function gcmrefactor () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "Refactor (${branch_name}): $1";
}

function gcmconfig () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "Config (${branch_name}): $1";
}

function gcmtest () {
  branch_name=$(git symbolic-ref -q HEAD)
  branch_name=${branch_name##refs/heads/}
  branch_name=${branch_name:-HEAD}
  gcm "Test (${branch_name}): $1";
}

function gbranchnuke: () {
  git branch -d $1 && git push origin --delete $1;
}

function gbc() {
  gb | grep $1 | xargs | pbcopy;
}

function gbs() {
  gb | grep $1 | xargs git checkout;
}
