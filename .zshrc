source zsh/rc.prompt
source zsh/rc.misc

# Homebrew
export HOMEBREW_NO_ENV_HINTS=0

# paperclip https://github.com/stjomd/paperclip/
paperclip() {
    python3 "$DEV/paperclip/paperclip.py" $@ -d $PWD
}

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
