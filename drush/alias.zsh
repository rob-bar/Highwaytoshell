# VIEW THIS FILE
alias aldrush='cat ~/.oh-my-zsh/custom/drush/alias.zsh'

# GENERAL
alias dcca='drush cc all'
alias dfr='drush fra -y'
alias dfrf='drush fra -y --force'
alias dgc='drush generate-content'
alias ds='d status'
alias dup='drush generate-content'
alias dpass='d upwd admin --password=admin'
alias dclear='drush updb; drush fra -y; drush cc all;'

alias d0='drush vset --yes preprocess_css 0;drush vset --yes preprocess_js 0;drush vset --yes cache 0;drush vset --yes block_cache 0;drush vset --yes page_compression 0;drush vset --yes error_level 0'
alias d1='drush vset --yes preprocess_css 1;drush vset --yes preprocess_js 1;drush vset --yes cache 1;drush vset --yes block_cache 1;drush vset --yes page_compression 1;drush vset --yes error_level 1'
