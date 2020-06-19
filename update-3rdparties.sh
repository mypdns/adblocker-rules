#!/usr/bin/env bash
#
# This script assumes a linux environment

TEMPFILE=(mktemp)

echo "*** uAssets: updating remote assets..."

declare -A assets
assets=(
    ['thirdparties/Yuki2718/ublock-anti-whitelist.txt']='https://raw.githubusercontent.com/Yuki2718/adblock/master/medium_mode/ublock-anti-whitelist.txt'
)

for i in "${!assets[@]}"; do
    localURL="$i"
    remoteURL="${assets[$i]}"
    echo "*** Downloading ${remoteURL}"
    if wget -q -T 30 -O $TEMPFILE -- $remoteURL; then
        if [ -s $TEMPFILE ]; then
            if ! cmp -s $TEMPFILE $localURL; then
                echo "    New version found: ${localURL}"
                if [ "$1" != "dry" ]; then
                    mv $TEMPFILE $localURL
                fi
            fi
        fi
    fi
done

# This will help minimize diff between updates
sort thirdparties/mirror1.malwaredomains.com/files/justdomains > $TEMPFILE
mv $TEMPFILE thirdparties/mirror1.malwaredomains.com/files/justdomains
