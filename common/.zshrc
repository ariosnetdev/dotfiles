# HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

XDG_CONFIG_HOME="${HOME}/.config"
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"

# Exports
export EDITOR=nvim

# set up PATH
export PATH=$PATH:~/.local/bin:~/.local/arios/bin

{% if is_arch_personal | default(False) %}
export PATH=$PATH:~/.local/go/bin:~/.local/cargo/bin
{% endif %}

bindkey -e

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"


zinit ice wait lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit load zsh-users/zsh-autosuggestions

zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# more zsh completions
fpath=(${HOME}/.config/zsh/completions $fpath)

# Use modern completion system
autoload -Uz compinit
compinit

autoload -z edit-command-line
zle -N edit-command-line

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# allows to use neovim to edit command line stuff
bindkey "^X^E" edit-command-line

# aliases
alias l='ls -lah --color'
alias godir="cd ~ && cd \$(fzf < <(fd --type d --hidden . ${HOME}))"
alias codir="cd \$(fzf < <(fd --type d --hidden . ${HOME}))"
alias vim="nvim"
alias fpass="pass -c \$(cd ~/.password-store && find . -type f ! -name '.gpg-id' | sed -En 's/\.\/(.*).gpg/\1/p' | fzf)"
alias lg="lazygit"

function sswitch() {

    local s_name=$(tmux ls -F '#S' | fzf)

    if [[ -z $TMUX ]]; then
        tmux a -t ${s_name}
    else
        tmux switch-client -t ${s_name}
    fi

    return
}

function sinit() {
    local dir=$(fzf < <(fd --type d --hidden . "${HOME}"))
    if [[ -z $dir ]]; then
        return
    fi

    local session_name=$(basename $dir)

    if ! tmux has-session -t ${session_name} 2>/dev/null;
    then
        tmux new-s -ds ${session_name} -c ${dir}
    fi

    if [[ -z $TMUX ]]; then
        tmux a -t ${session_name}
    else
        tmux switch-client -t ${session_name}
    fi
}

{% if is_osx_work | default(False) %}
function resetGp() {
    eval "launchctl unload /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"
    eval "launchctl load /Library/LaunchAgents/com.paloaltonetworks.gp.pangp*"    
}

# this file will not exist
export NODE_EXTRA_CA_CERTS="${HOME}/.config/charter/root-ca.pem"
export JAVA_HOME=`/usr/libexec/java_home -v 21`
{% endif %}

source <(fzf --zsh)
eval "$(fnm env --use-on-cd --shell zsh)"

