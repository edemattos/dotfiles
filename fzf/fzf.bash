# Setup fzf
# ---------
if [[ ! "$PATH" == *${HOMEBREW_PREFIX}/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${HOMEBREW_PREFIX}/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOMEBREW_PREFIX}/opt/fzf/shell/completion.bash" 2> /dev/null

# Default preferences and key bindings
# ------------
source "${DOTFILES}/fzf/fzf.sh"
source "${HOMEBREW_PREFIX}/opt/fzf/shell/key-bindings.bash"
source "${DOTFILES}/fzf/fzf-git.sh/fzf-git.sh"
