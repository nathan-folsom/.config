# Prompt Formatting
#
# main prompt
PS1='%S %#%n %~ %s '
# Show git branch in right prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:git:*' formats '(%s)->[%b]'
zstyle ':vcs_info:git:*' actionformats '(%s)->[%b|%a]'
precmd() { vcs_info }
setopt prompt_subst
RPS1='%S ${vcs_info_msg_0_} %* %s'


export PATH=/opt/homebrew/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

