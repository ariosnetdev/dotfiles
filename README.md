# Fresh Mac book install

## .dmg and .pkgs

We install these manually

- https://github.com/alacritty/alacritty/releases/download/v0.15.1/Alacritty-v0.15.1.dmg
- https://github.com/Homebrew/brew/releases/download/4.5.10/Homebrew-4.5.10.pkg
- https://github.com/zen-browser/desktop/releases/latest/download/zen.macos-universal.dmg
- https://slack.com/downloads/instructions/mac?ddl=1&build=mac


## set up ansible

- `./assert_ansible.sh`

## run playbook

```sh
$ ansible-playbook --diff -c localhost playbook.yml -v
```

## Dependencies to track

* zinit - https://github.com/zdharma-continuum/zinit
* tpm - https://github.com/tmux-plugins/tpm

plan should be to mirror these into a charter git at some point

