#!/bin/bash

OPTIND=1 # Reset in case previously used in shell

source $PWD/build-functions.sh
source $PWD/build-variables.sh

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

if [ "$(toLower $1)" == "make" ]; then
    . $PWD/$MAKE_SCRIPT
    exit 0
fi

# Process arguments
while getopts ":p:n:c:s:h:" opt; do
    case "$opt" in
        p)
            . $PWD/$PROJECT_SCRIPT
            setFileNameVariables $OPTARG
            buildProject; exit 0;;
        n)
            . $PWD/$NAMESPACE_SCRIPT
            setFileNameVariables $OPTARG
            buildNamespace; exit 0;;
        c)
            . $PWD/$CLASS_SCRIPT
            setFileNameVariables $OPTARG
            buildClass; exit 0;;
        s)
            . $PWD/$STRUCT_SCRIPT
            setFileNameVariables $OPTARG
            buildStruct; exit 0;;
        h)
            . $PWD/$HEADER_SCRIPT
            setFileNameVariables $OPTARG
            buildHeader; exit 0;;
        : )
            echo "Missing option argument for -$OPTARG" >&2; exit 1;;
        *)
            usage; exit 1;;
    esac
done
