directory() {
  echo "%{$fg[green]%}%2~ % %{$reset_color%}"
}

prompt() {
  echo "%{$fg_bold[cyan]%}➣%{$reset_color%}" # 〉🌻
}

node_version() {
  echo "%{$fg[green]%}⬡ $(nvm current)%{$reset_color%}"
}

customer_output() {
  echo "with $(customer)"
}

PROMPT='$(directory)%{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%} $(customer_output) $(node_version)
%* $(prompt) '
# %{$fg_bold[green]%}%p # not sure what %p does
# RPROMPT='%{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%}%{$reset_color%} %T'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*%{$fg[green]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}]"


