# NOTE: ZDOTDIR is set in /etc/zshenv

# brew
export HOMEBREW_PREFIX=${HOMEBREW_PREFIX:-/usr/local}
export HOMEBREW_NO_AUTO_UPDATE=1
# global text editor
export EDITOR=${HOMEBREW_PREFIX}/bin/nano
# lsd
export LS_COLORS="$(vivid generate custom)"
# docker compose
export DOCKER_SCAN_SUGGEST=false

# XDG paths
export XDG_DATA_HOME=${HOME}/.local/share
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_RUNTIME_DIR=/run/user/$UID

# zsh
export HISTFILE=${ZDOTDIR}/.zsh_history
# aws
export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
# docker
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker
# ffmpeg
export FFMPEG_DATADIR=${XDG_CONFIG_HOME}/ffmpeg
# ipython/jupyter
export IPYTHONDIR=${XDG_CONFIG_HOME}/ipython
export JUPYTER_CONFIG_DIR=${XDG_CONFIG_HOME}/jupyter
# less
export LESSHISTFILE=-
# mypy
export MYPY_CACHE_DIR=${XDG_CACHE_HOME}/mypy
# ncurses
export TERMINFO=${XDG_DATA_HOME}/terminfo
export TERMINFO_DIRS=${XDG_DATA_HOME}/terminfo:/usr/share/terminfo
# python
export PYTHONSTARTUP=${XDG_CONFIG_HOME}/python/pythonrc
# ripgrep
export RIPGREP_CONFIG_PATH=${XDG_CONFIG_HOME}/ripgrep/config
# texmf
export TEXMFHOME=${XDG_DATA_HOME}/texmf
# wget
export WGETRC=${XDG_CONFIG_HOME}/wget/wgetrc
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
