# XDG paths
export XDG_LOCAL_HOME=${HOME}/.local
export XDG_DATA_HOME=${XDG_LOCAL_HOME}/share
export XDG_STATE_HOME=${XDG_LOCAL_HOME}/state
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_RUNTIME_DIR=/run/user/$UID

# add local binaries to PATH
export PATH=${PATH}:${XDG_LOCAL_HOME}/bin

# aws
export AWS_SHARED_CREDENTIALS_FILE=${XDG_CONFIG_HOME}/aws/credentials
export AWS_CONFIG_FILE=${XDG_CONFIG_HOME}/aws/config
# docker
export DOCKER_CONFIG=${XDG_CONFIG_HOME}/docker
export DOCKER_SCAN_SUGGEST=false
# ffmpeg
export FFMPEG_DATADIR=${XDG_CONFIG_HOME}/ffmpeg
# ipython/jupyter
export IPYTHONDIR=${XDG_CONFIG_HOME}/ipython
export JUPYTER_CONFIG_DIR=${XDG_CONFIG_HOME}/jupyter
# less
export LESSHISTFILE=-
# lsd
export LS_COLORS="$(vivid generate custom)"
# mypy
export MYPY_CACHE_DIR=${XDG_CACHE_HOME}/mypy
# ncurses
export TERMINFO=${XDG_DATA_HOME}/terminfo
export TERMINFO_DIRS=${XDG_DATA_HOME}/terminfo:/usr/share/terminfo
# python
export PYTHONSTARTUP=${XDG_CONFIG_HOME}/python/pythonrc
# starship
export STARSHIP_CONFIG=${XDG_CONFIG_HOME}/starship/starship.toml
# ripgrep
export RIPGREP_CONFIG_PATH=${XDG_CONFIG_HOME}/ripgrep/config
# texmf
export TEXMFHOME=${XDG_DATA_HOME}/texmf
# wget
export WGETRC=${XDG_CONFIG_HOME}/wget/wgetrc
alias wget="wget --hsts-file=${XDG_DATA_HOME}/wget-hsts"
