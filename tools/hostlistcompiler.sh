#!/usr/bin/env sh

set -e
# set -x

BUILD="$(git rev-parse --short HEAD)"
GIT_DIR="$(git rev-parse --show-toplevel)"

# export DEBIAN_FRONTEND=noninteractive
# apt-get install -yqqf npm

git checkout master
git pull -f

npm i -g @adguard/hostlist-compiler

sed -i "s/framagit/0xacab/g" "$GIT_DIR/tools/hostscompilerconf.json"

hostlist-compiler -c "$GIT_DIR/tools/hostscompilerconf.json" \
    -o "$GIT_DIR/_public/blockrules.txt"

echo "List the first 15 lines"
echo ""
head -n 15 _public/blockrules.txt
echo ""

# git add _public/blockrules.txt
# git commit -m "AdBlocker list updated. BuildID $BUILD"
# git pull --rebase
# git push "https://spirillen:${CI_ACCESS_TOKEN}@${CI_REPOSITORY_URL#*@}" "HEAD:${CI_COMMIT_REF_NAME} [skip-ci]"
