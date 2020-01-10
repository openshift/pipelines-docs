#!/bin/bash
cd "${0%/*}" # cd to folder with script
antora site.yml # build the docs with antora
RESULT=($?)
if [ $RESULT -eq 127 ]; then #if antora is not installed 
    echo "Install Antora from https://docs.antora.org/antora/2.2/install/install-antora/"
    exit 1
else
    echo "Building docs with Antora"
    antora site.yml
    echo "Copying generated docs to root folder"
    cp -rf build/site/* .
    echo "DONE. Review the generated documentation in docs/index.html and then submit a pull request to openshift-docs repo"
fi
exit 0