### -- PROMPT ---(begin)----------------------------------------------------------
setopt PROMPT_SUBST
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "(%b)"

precmd() {
  vcs_info
  if [ $(git branch > /dev/null 2>&1; echo $?) -eq 0 ]; then
    # inside a git repository
    P_BRANCH=" %F{$P_GIT_COLOR}${vcs_info_msg_0_}%f"
  else
    P_BRANCH=""
  fi
}

P_USER_COLOR="green"
P_HOSTNAME_COLOR="green"
P_DIR_COLOR="cyan"
P_GIT_COLOR="red"

P_USER="%F{$P_USER_COLOR}%n%f"
P_HOSTNAME="%F{$P_HOSTNAME_COLOR}%m%f"
P_DIRECTORY="%B%F{$P_DIR_COLOR}%~%f%b" # %~ is full directory, %c is base directory
P_SIGN="%B>%b"
P_LINEBREAK=$'\n'

export PROMPT='$P_USER@$P_HOSTNAME:$P_DIRECTORY$P_BRANCH$P_LINEBREAK$P_SIGN '
### -- PROMPT ---(end)------------------------------------------------------------

# Homebrew
export HOMEBREW_NO_ENV_HINTS=0

# Files & directories
export ZENV=~/.zshenv
export ZRC=~/.zshrc
export DEV=~/dev

# Aliases
alias ll="ls -lAh -D '%d-%b-%Y %T' --color=always"
alias tldr='tldr -L en'
alias gh="history 0 | grep"

# Quickly get JDK's location
wherejdk() {
    if [ -n "$1" ]; then
        echo $(/usr/libexec/java_home -v $1)
    else
        echo "The \$JAVA_HOME variable is currently set to JDK $PREFERRED_JDK_VERSION:"
        echo $JAVA_HOME
    fi
}

# paperclip https://github.com/stjomd/paperclip/
paperclip() {
    python3 "$DEV/paperclip/paperclip.py" $@ -d $PWD
}

# ls command colors
export CLICOLOR=1
export LSCOLORS=ExGxBxdxCxEgEdxbxgacec

# Use Option + Left/Right to move one word
bindkey "[D" backward-word
bindkey "[C" forward-word

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
