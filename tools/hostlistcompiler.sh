#!/usr/bin/env sh

set -e -x

GIT_DIR="$(git rev-parse --show-toplevel)"

# export DEBIAN_FRONTEND=noninteractive
# apt-get install -yqqf npm

npm i -g @adguard/hostlist-compiler

hostlist-compiler -c "$GIT_DIR/tools/hostscompilerconf.json" \
    -o "$GIT_DIR/_public/blockrules.txt"

echo "List the first 15 lines"
echo ""
head -n 15 _public/blockrules.txt
echo ""
