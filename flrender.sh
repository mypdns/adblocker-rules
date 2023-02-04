#!/usr/bin/env sh

set -e -x

# This script is to run the flrender tool to generate new adblocker lists
# from AdBlocker-rules.template.

# Since Github have choosen to disable the Actions (GHA) we will be running
# this code directly on My Privacy DNS's server by using conda

# First check if conda is installed
# We use git dir to make it CI independent
GIT_DIR="$(git rev-parse --show-toplevel)"

BUILD="$(git rev-parse --short HEAD)"

# Goto repo root
cd "${GIT_DIR}"

# Remove old blocklist
if [ -f _public/blockrules.txt ]; then rm -f _public/blockrules.txt; fi

# Render the rules
flrender -v -i ublockorigin-rules=. adblocker-rules.template _public/blockrules.txt

sed -i "s/\! BuildID:/\! BuildID: $BUILD/g" _public/blockrules.txt

# Copyright: https://mypdns.org/
# Content: https://mypdns.org/spirillen/
# Source: https://framagit.org/my-privacy-dns/adblocker-rules
# License: https://framagit.org/my-privacy-dns/adblocker-rules/-/blob/master/LICENSE
# License: MCRAE GENERAL PUBLIC LICENSE (version 4.r53m2)
#
# You should have received a copy of the license along with this work.
