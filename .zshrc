CONFIGS_DIR=$(dirname $(readlink -f ~/.zshrc))
source "$CONFIGS_DIR/zsh/rc.prompt"

export EDITOR=vim
export HISTCONTROL=ignoreboth
export HOMEBREW_NO_ENV_HINTS=0

# Files & directories
export ZENV=~/.zshenv
export ZRC=~/.zshrc
export DEV=~/dev

# Aliases
alias cgrep='grep --color=always'
alias clean='clear && source ~/.zshrc'
alias cp='cp -i'
alias gh='history 0 | grep'
alias grep='grep --color=auto'
alias la='ls -a'
alias ls='ls --color=auto'
alias ll="ls -lh -D '%d-%b-%Y %T'"
alias lla='ll -a'
alias mv='mv -i'
alias rm='rm -i'
alias tldr='tldr -L en'

# ls command colors
export CLICOLOR=1
export LSCOLORS=ExGxBxdxCxEgEdxbxgacec

# Use Option + Left/Right to move one word
bindkey "[D" backward-word
bindkey "[C" forward-word

# Quickly get JDK's location
wherejdk() {
    if [ -n "$1" ]; then
        echo $(/usr/libexec/java_home -v $1)
    else
        echo "The \$JAVA_HOME variable is currently set to JDK $PREFERRED_JDK_VERSION:"
        echo "$JAVA_HOME"
    fi
}

# paperclip https://github.com/stjomd/paperclip/
paperclip() {
    python3 "$DEV/paperclip/paperclip.py" "$@" -d "$PWD"
}

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

"$CONFIGS_DIR/zsh/welcome"
