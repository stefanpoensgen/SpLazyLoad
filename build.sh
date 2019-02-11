#!/usr/bin/env bash

PLUGIN_NAME="SpLazyLoad"

commit=$1
if [ -z ${commit} ]; then
    commit=$(git tag | tail -n 1)
    if [ -z ${commit} ]; then
        commit="master";
    fi
fi

# Remove old release
rm -rf ${PLUGIN_NAME} ${PLUGIN_NAME}-*.zip

# Build new release
mkdir -p ${PLUGIN_NAME}
git archive ${commit} | tar -x -C ${PLUGIN_NAME}
composer install --no-dev -n -o -d ${PLUGIN_NAME}
zip -x "*build.sh*" -x "*.MD" -r ${PLUGIN_NAME}-${commit}.zip ${PLUGIN_NAME}
