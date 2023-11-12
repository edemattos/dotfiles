# Setup fzf
# ---------
if [[ ! "$PATH" == *${XDG_LOCAL_HOME}/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${XDG_LOCAL_HOME}/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${XDG_LOCAL_HOME}/opt/fzf/shell/completion.bash" 2> /dev/null

# Default preferences and key bindings
# ------------
source "${DOTFILES}/fzf/fzf.sh"
source "${XDG_LOCAL_HOME}/fzf/shell/key-bindings.bash"
source "${DOTFILES}/fzf/fzf-git.sh/fzf-git.sh"
