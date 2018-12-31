#!/bin/bash

OPTIND=1 # Reset in case previously used in shell

SOURCE_DIR="$(dirname "$(readlink -f "$0")")"

source $SOURCE_DIR/build-functions.sh
source $SOURCE_DIR/build-variables.sh

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

if [ "$(toLower $1)" == "make" ]; then
    . $SOURCE_DIR/$MAKE_SCRIPT
    exit 0
fi

# Process arguments
while getopts ":p:n:c:s:h:" opt; do
    case "$opt" in
        p)
            . $SOURCE_DIR/$PROJECT_SCRIPT
            setFileNameVariables $OPTARG
            buildProject; exit 0;;
        n)
            . $SOURCE_DIR/$NAMESPACE_SCRIPT
            setFileNameVariables $OPTARG
            buildNamespace; exit 0;;
        c)
            . $SOURCE_DIR/$CLASS_SCRIPT
            setFileNameVariables $OPTARG
            buildClass; exit 0;;
        s)
            . $SOURCE_DIR/$STRUCT_SCRIPT
            setFileNameVariables $OPTARG
            buildStruct; exit 0;;
        h)
            . $SOURCE_DIR/$HEADER_SCRIPT
            setFileNameVariables $OPTARG
            buildHeader; exit 0;;
        : )
            echo "Missing option argument for -$OPTARG" >&2; exit 1;;
        *)
            usage; exit 1;;
    esac
done
