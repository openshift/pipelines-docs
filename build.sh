#!/bin/bash
cd "${0%/*}" # cd to folder with script
antora site.yml # build the docs with antora
RESULT=($?)
if [ $RESULT -eq 127 ]; then #if antora is not found in $PATH (probably not installed) 
    echo "Command not found in \$PATH, Install Antora from https://docs.antora.org/antora/2.2/install/install-antora/"
    exit 1
else
    echo "Building docs with Antora"
    antora site.yml
    echo "Copying generated docs to root folder"
    cp -rf build/site/* .
    echo "DONE. Review the generated documentation in docs/index.html, commit the changes and submit a pull request to openshift-docs repo"
fi
exit 0