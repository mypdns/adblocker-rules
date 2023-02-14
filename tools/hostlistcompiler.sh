#!/usr/bin/env sh

set -e -x

BUILD="$(git rev-parse --short HEAD)"
GIT_DIR="$(git rev-parse --show-toplevel)"

# export DEBIAN_FRONTEND=noninteractive
# apt-get install -yqqf npm

git checkout master

npm i -g @adguard/hostlist-compiler

hostlist-compiler -c "$GIT_DIR/tools/hostscompilerconf.json" \
    -o "$GIT_DIR/_public/blockrules.txt"

echo "List the first 15 lines"
echo ""
head -n 15 _public/blockrules.txt
echo ""

git add _public/blockrules.txt
git commit -m "AdBlocker list updated. BuildID $BUILD"
git pull --rebase
git push "https://spirillen:${mypdns_CI_ACCESS_TOKEN}@${CI_REPOSITORY_URL#*@}" "HEAD:${CI_COMMIT_REF_NAME}" -o skip-ci