#/bin/bash

set -eou pipefail

if [[ ! -z $(which conda) ]]; then
    echo "Already exists: conda"
    exit 0
fi

echo "Installing conda"
miniforge="Miniforge3-$(uname)-$(uname -m).sh"
curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/${miniforge}" &&
bash ${miniforge} -b -p ${XDG_LOCAL_HOME}/miniforge3 &&
rm ${miniforge}
${XDG_LOCAL_HOME}/miniforge3/bin/conda init "$(basename "${SHELL}")" > /dev/null
${XDG_LOCAL_HOME}/miniforge3/bin/conda config --file ${XDG_CONFIG_HOME}/conda/condarc --set env_prompt ''
