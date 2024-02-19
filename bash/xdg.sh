# XDG paths
export XDG_LOCAL_HOME=${HOME}/.local
export XDG_DATA_HOME=${XDG_LOCAL_HOME}/share
export XDG_STATE_HOME=${XDG_LOCAL_HOME}/state
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_RUNTIME_DIR=/run/user/$UID

# add local binaries to PATH
export PATH=${PATH}:${XDG_LOCAL_HOME}/bin
