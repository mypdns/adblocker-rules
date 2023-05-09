#!/usr/bin/env sh

set -eu -o pipefail # fail on error and report it, debug all lines

GIT_DIR="$(git rev-parse --show-toplvel)"

# export DEBIAN_FRONTEND=noninteractive
# apt-get install -yqf npm

git switch master
# git pull -f

npm i -g @adguard/hostlist-compiler
npm audit fix --force

hostlist-compiler -c "$GIT_DIR/tools/hostscompilerconf.json" \
    -o "$GIT_DIR/_public/blockrules.txt"

echo "List the first 15 lines"
echo ""
head -n 15 _public/blockrules.txt
echo ""
