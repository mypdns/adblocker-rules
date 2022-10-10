#!/usr/bin/env sh

set -e #-x

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

#source ~/miniconda/etc/profile.d/conda.sh
#conda activate AdBlocker

# Render the rules
cp -R _public/ public/
flrender -v -i ublockorigin-rules=. adblocker-rules.template public/blockrules.txt

if [ -f "public/blockrules.txt"]; then
    rsync -avP --chown "$USER" "public/" "/var/www/mypdns.org/public/adblocker-rules/"
    if [ -d "public/" ]; then
        rm -fr "public/"
    fi
else
    echo "Script failed to generate output"
    # conda deactivate
    exit 99
fi

# conda deactivate
#
#
# Copyright: https://mypdns.org/
# Content: https://mypdns.org/spirillen/
# Source: https://mypdns.org/my-privacy-dns/adblocker-rules
# License: https://mypdns.org/my-privacy-dns/adblocker-rules/-/blob/master/LICENSE
# License: MCRAE GENERAL PUBLIC LICENSE (version 4.r53m2)
#
# You should have received a copy of the license along with this work.
