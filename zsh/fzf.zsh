# see ~/${XDG_CONFIG_HOME}/fd/ignore for excluded patterns

[ -f ${XDG_CONFIG_HOME}/fzf/fzf.zsh ] && source ${XDG_CONFIG_HOME}/fzf/fzf.zsh

# use fd instead of find
# export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow"
export FZF_DEFAULT_COMMAND="fd --hidden --follow . $HOME"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# set nord color theme and other preferences
export FZF_DEFAULT_OPTS="
  --reverse
  --prompt='❯ ' --pointer='❯' --marker='❯' --info=inline:'❮ '
  --color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C
  --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B
"

# use bat preview window with CTRL + T
export FZF_CTRL_T_OPTS="
  --preview 'bat -p --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'
"

# set ALT + C (ESC + C or CTRL-[ + C) preferences
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow . $HOME"
