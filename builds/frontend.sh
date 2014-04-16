# -----------------------------------------------------
# SETTUP & DOWNLOADS
# -----------------------------------------------------
# folders
mkdir assets assets/css assets/sass assets/sass/lib assets/img assets/img/layout assets/img/sprite assets/img/svg assets/img/logo assets/img/2x assets/font assets/download assets/js assets/js/vendor assets/coffee;

# index files
curl -o index.html https://gist.githubusercontent.com/rob-bar/8973105/raw/8fd1f4d98a9f8802c43718499a73afd0fade2028/html5boiler.html;

# # project builds
curl -O3 https://raw.githubusercontent.com/rob-bar/grunt-compile-bootstrap/master/Gruntfile.coffee;
curl -O3 https://raw.githubusercontent.com/rob-bar/grunt-compile-bootstrap/master/package.json;
curl -O https://gist.githubusercontent.com/rob-bar/8578510/raw/6e2b0fc5630e6f6f2bdb75d5695d5680f1c5b2c3/Gemfile;
curl -O3 https://raw.githubusercontent.com/rob-bar/drupal-theme-boilerplate/master/.gitignore;

# sass
curl -3 -o  assets/sass/lib/mixin.sass https://raw.githubusercontent.com/rob-bar/drupal-theme-boilerplate/master/assets/sass/lib/mixin.sass;
curl -3 -o assets/sass/lib/var.sass https://raw.githubusercontent.com/rob-bar/drupal-theme-boilerplate/master/assets/sass/lib/var.sass;
curl -o assets/sass/style.sass https://gist.githubusercontent.com/rob-bar/5566692/raw/a681a70e7e17060c8008aed05b96fc55efee7ea8/style.sass;

#coffee
curl -o assets/coffee/base.coffee https://gist.githubusercontent.com/rob-bar/7230047/raw/538bf22944ef4e60719653b0cb9663f70fbfae31/base.coffee;

#js
curl -o assets/js/vendor/jquery.js http://code.jquery.com/jquery.js;
curl -o assets/js/vendor/modernizr.js https://gist.githubusercontent.com/rob-bar/10843541/raw/eaae16e09daf3f7dcecb78f6c8d76dc4876fc42d/modernizr.js;

# -----------------------------------------------------
# INSTALLATION
# -----------------------------------------------------
bundle install; # Install all gems
npm install; # npm install
git init; # git install empty repo
pwd > tree.xiki; # xiki buffer for st
subl .;
subl *.xiki; # open folder in sublime text
