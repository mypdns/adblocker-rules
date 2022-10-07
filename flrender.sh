#!/usr/bin/env sh

# This script is to run the flrender tool to generate new adblocker lists
# from AdBlocker-rules.template.

# Since Github have choosen to disable the Actions (GHA) we will be running
# this code directly on My Privacy DNS's server by using conda

# First check if conda is installed
# We use git dir to make it CI independent
GIT_DIR="$(git rev-parse --show-toplevel)"

# Goto repo root
cd "${GIT_DIR}"

echo "..."
echo "Let's install conda to prevent uncontrolled things to happens"
echo ""
echo "Any surprises that Ubuntu brakes everything??"
echo "..."
echo ""

# Conda installer
if [ -d "${HOME}/miniconda" ]; then
    # Update Conda
    echo "Update Conda"
    echo ""

    if [ -f "${GIT_DIR}/miniconda/etc/profile.d/conda.sh" ]; then
        source "${GIT_DIR}/miniconda/etc/profile.d/conda.sh"
    fi

    conda update conda -c conda-canary
    conda update -yq conda
    conda config --set channel_priority false

else
    # install Conda
    echo "Update Conda"
    echo ""
    curl 'https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh' -o "${GIT_DIR}/miniconda.sh"
    bash miniconda.sh -b -p "${HOME}/miniconda"
    hash -r

    if [ -f "${GIT_DIR}/miniconda/etc/profile.d/conda.sh" ]; then
        source "${GIT_DIR}/miniconda/etc/profile.d/conda.sh"
    fi

    conda config --set always_yes yes --set changeps1 no
    conda config --add channels conda-forge
    conda update conda -c conda-canary
    conda update -yq conda
    conda config --set channel_priority false
fi

# Env installer
if [ -n "$(conda info --envs | cut -d ' ' -f 1 | grep -i 'AdBlocker')" ]; then
    echo "Create conda ENV"
    conda config --add channels conda-forge
    conda update conda -c conda-canary
    conda config --set channel_priority false
    conda create -q -n AdBlocker \
        -f "${GIT_DIR}/.environment.yaml" --all
else
    echo "Install fresh conda ENV"
    conda env update -n AdBlocker \
        -f "${GIT_DIR}/.environment.yaml" --prune
fi

# Activate Conda
if [ -f "${GIT_DIR}/miniconda/etc/profile.d/conda.sh" ]; then
    source "${GIT_DIR}/miniconda/etc/profile.d/conda.sh"
    conda activate AdBlocker
else
    echo "Conda not installed or active"
fi

# Render the rules
flrender -v -i ublockorigin-rules=. adblocker-rules.template public/blockrules.txt

if [ -f "public/blockrules.txt"]; then
    rsync -avP --chown "$USER" "public/" "/var/www/mypdns.org/public/adblocker-rules/"
    if [ -d "public/" ]; then
        rm -fr "public/"
    fi
else
    echo "Script failed to generate output"
    conda deactivate
    exit 99
fi

conda deactivate
conda env remove -n AdBlocker

#
#
#
#
#
#
#
#
#
#
#
#
# Copyright: https://mypdns.org/
# Content: https://mypdns.org/spirillen/
# Source: https://mypdns.org/my-privacy-dns/adblocker-rules
# License: https://mypdns.org/my-privacy-dns/adblocker-rules/-/blob/master/LICENSE
# License: MCRAE GENERAL PUBLIC LICENSE (version 4.r53m2)
#
# You should have received a copy of the license along with this work.
