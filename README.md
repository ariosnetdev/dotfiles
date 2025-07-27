# Dot files

- `common` -> common configs that can be re-used across machines
- `arch` -> arch specific configs
- `mac` -> mac specific configs

## General Usage

we use ansible to install dependencies and template out the home folder.
the output of the ansible run will then be put in ./home-dist.

trom here the playbok will use [Gnu stow](https://www.gnu.org/software/stow/) to symlink dotfiles into the home folder

### ensure ansible set up is ready

- `./assert_ansible.sh`

### run playbook

```sh
$ ansible-playbook --diff -c localhost playbook.yml -v
```

### other playbook runs

```sh
# update home-dist folder with any new configs
$ ansible-playbook --diff -c localhost playbook.yml -v --tags dotfiles

# rerun the dotfiles configuration and stow
$ ansible-playbook --diff -c localhost playbook.yml -v --tags dotfiles,stow
```

### Dependencies to track

* zinit - https://github.com/zdharma-continuum/zinit
* tpm - https://github.com/tmux-plugins/tpm

Ideally I think these should be checked out / installed as part of the ansible run

## Fresh Mac book install

### .dmg and .pkgs

We install these manually

- https://github.com/alacritty/alacritty/releases/download/v0.15.1/Alacritty-v0.15.1.dmg
- https://github.com/Homebrew/brew/releases/download/4.5.10/Homebrew-4.5.10.pkg
- https://github.com/zen-browser/desktop/releases/latest/download/zen.macos-universal.dmg
- https://slack.com/downloads/instructions/mac?ddl=1&build=mac




