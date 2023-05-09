#!/usr/bin/env sh

set -e
# set -x

GIT_DIR="$(git rev-parse --show-toplvel)"

# export DEBIAN_FRONTEND=noninteractive
# apt-get install -yqf npm

git switch master
# git pull -f

npm i -g @adguard/hostlist-compiler

sed -i "s/framagit/0xacab/g" "$GIT_DIR/tools/hostscompilerconf.json"

hostlist-compiler -c "$GIT_DIR/tools/hostscompilerconf.json" \
    -o "$GIT_DIR/_public/blockrules.txt"

echo "List the first 15 lines"
echo ""
head -n 15 _public/blockrules.txt
echo ""
