# Enable completions
autoload -Uz compinit
compinit

# Prompt Formatting
#
g1=249 # light gray foreground
g2=238 # dark gray background
PS1='%K{$g2} %F{$g1}%#%f %F{1}%n%f %F{$g1}%~ %k%f%F{$g2}|>%f' # main prompt
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' enable git 
zstyle ':vcs_info:git:*' formats '%{'%F{$g1}'%}%s/%f%F{1}%b%f%{'%F{$g1}'%}%f'
formatted=''
precmd() { 
  vcs_info
  if [[ -n $vcs_info_msg_0_ ]]; then
    formatted=$vcs_info_msg_0_
  else
    text=$'%{\e[9m%}git%{\e[0m%}'
    formatted="%F{$g1}$text%f%K{$g2}"
  fi
}
RPS1='%F{$g2}<|%f%K{$g2} ${formatted} %F{$g1}%*%f %k' # right prompt


export PATH=/opt/homebrew/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# Ctrl+Z toggle between two suspended jobs
toggle-fg() {
  if [[ $#BUFFER -eq 0 ]]; then
    if [[ $(jobs | wc -l) -ge 2 ]]; then
      BUFFER="fg %-"
      zle accept-line
    elif [[ $(jobs | wc -l) -eq 1 ]]; then
      BUFFER="fg"
      zle accept-line
    fi
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N toggle-fg
bindkey '^Z' toggle-fg

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

