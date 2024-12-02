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

    ohai 'Updating .gitignore'
    if [ ! -f .gitignore ]; then
        touch .gitignore
    fi
    if ! grep -q '^node_modules/$' .gitignore; then
        echo 'node_modules/' >> .gitignore
    fi
    if ! grep -q '^package-lock.json$' .gitignore; then
        echo 'package-lock.json' >> .gitignore
    fi
    if ! grep -q '^gitleaks-report.json$' .gitignore; then
        echo 'gitleaks-report.json' >> .gitignore
    fi

else
    echo "NPM is not installed. Please install npm and try again."
fi
