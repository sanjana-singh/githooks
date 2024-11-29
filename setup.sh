#!/bin/bash

# Treat unset variables as an error
set -o nounset

# string formatters
if [[ -t 1 ]]
then
  tty_escape() { printf "\033[%sm" "$1"; }
else
  tty_escape() { :; }
fi

tty_mkbold() { tty_escape "1;$1"; }
tty_underline="$(tty_escape "4;39")"
tty_blue="$(tty_mkbold 34)"
tty_red="$(tty_mkbold 31)"
tty_green="$(tty_mkbold 32)"
tty_bold="$(tty_mkbold 39)"
tty_reset="$(tty_escape 0)"

shell_join() {
  local arg
  printf "%s" "$1"
  shift
  for arg in "$@"
  do
    printf " "
    printf "%s" "${arg// /\ }"
  done
}

ohai() {
  printf "${tty_blue}==>${tty_bold} %s${tty_reset}\n" "$(shell_join "$@")"
}

ohai 'Checking if npm installed'
if which npm > /dev/null; then
    npm -v

    ohai 'Initializing npm'
    npm init -y
    
    ohai 'Installing eslint'
    npm install eslint --save-dev && npx eslint --init

    ohai 'Installing husky'
    npm install --save-dev husky

    ohai 'Initializing husky'
    npx husky init && npm install

    ohai 'Copying pre-commit hooks'
    git clone https://github.com/sanjana-singh/Githooks_poc.git

    ohai 'Copying pre-commit hooks'
    cp -r Githooks_poc/.husky .
    rm -rf Githooks_poc

    ohai 'Changing permissions'
    chmod +x .husky/pre-commits/*
    chmod +x .husky/pre-commits

    ohai 'Checking if stylelint is installed'
    if ! npm list stylelint > /dev/null 2>&1; then
        ohai 'Installing stylelint'
        npm install stylelint stylelint-config-standard --save-dev
    else
        ohai 'stylelint is already installed'
    fi

    ohai 'Checking if .stylelintrc.json exists'
if [ ! -f .stylelintrc.json ]; then
    ohai 'Creating .stylelintrc.json'
    cat <<EOL > .stylelintrc.json
{
  "extends": "stylelint-config-standard",
  "rules": {
  }
}
EOL
else
    ohai '.stylelintrc.json already exists'
fi

ohai 'Checking if package.json contains lint:css script'
if ! grep -q '"lint:css":' package.json; then
    ohai 'Updating package.json to include lint:css script'
    npx json -I -f package.json -e 'this.scripts["lint:css"]="stylelint **/*.css"'
else
    ohai 'lint:css script already exists in package.json'
fi

ohai 'Installing eslint'
npm install eslint@latest --save-dev && npx eslint --init

ohai 'Installing husky'
npm install husky@latest --save-dev

ohai 'Initializing husky'
npx husky init && npm install

ohai 'Copying pre-commit hooks'
git clone https://github.com/sanjana-singh/Githooks_poc.git

ohai 'Copying pre-commit hooks'
cp -r Githooks_poc/.husky .
rm -rf Githooks_poc

ohai 'Changing permissions'
chmod +x .husky/pre-commits/*
chmod +x .husky/pre-commits

ohai 'Checking if stylelint is installed'
if ! npm list stylelint > /dev/null 2>&1; then
    ohai 'Installing stylelint'
    npm install stylelint@latest stylelint-config-standard@latest --save-dev
else
    ohai 'stylelint is already installed'
fi
