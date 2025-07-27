#!/bin/bash

set -e

ccmd() {
    command -v $1 >/dev/null 2>&1
}

! ccmd brew && {
    echo "need homebrew installed in the system"
    exit 1
}

brew install pipx

pipx ensurepath

sudo pipx ensurepath --global

brew update && brew upgrade pipx

pipx install --include-deps ansible

echo "close shell and reopen to run ansible playbooks"
