# Prompt Formatting
#
# main prompt
g1=249 # light gray foreground
g2=238 # dark gray background
PS1='%K{$g2} %F{$g1}%#%f %F{1}%n%f %F{$g1}%~ %k%f%F{$g2}|>%f'
# Show git branch in right prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:git:*' formats '%{'%F{$g1}'%}(%f%F{1}%s%f%{'%F{$g1}'%})->[%f%F{1}%b%f%{'%F{$g1}'%}]%f'
precmd() { vcs_info }
RPS1='%F{$g2}<|%f%K{$g2} ${vcs_info_msg_0_} %F{$g1}%*%f %k'


export PATH=/opt/homebrew/bin:$PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

