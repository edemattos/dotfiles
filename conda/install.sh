#/bin/bash

set -eou pipefail

if [[ -z $(which mamba) ]]; then

    echo "Installing conda"
    miniforge="Miniforge3-$(uname)-$(uname -m).sh"
    curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/${miniforge}" &&
    bash ${miniforge} -b -p ${XDG_LOCAL_HOME}/miniforge3 &&
    rm ${miniforge}

fi
