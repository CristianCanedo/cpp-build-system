#!/bin/bash

# Functions for "Build"

usage() {
cat << EOF
usage: build [<option> <file_name>] [make]

    -p             build project with parent directory and sub directories
    -n             build namespace files in src/ and include/ directories
    -c             build class files in src/ and include/ directories
    -s             build struct files src/ and include/ directories
    -h             build single header file under include/ directory
    make           generate Makefile
EOF
}

toLower() {
    echo "$1" | tr '[:upper:]' '[:lower:]'
}

toUpper() {
    echo "$1" | tr '[:lower:]' '[:upper:]'
}

setFileNameVariables() {
    FILE_NAME="$1"
    LOWERCASE_NAME="$(toLower $FILE_NAME)"
    UPPERCASE_NAME="$(toUpper $FILE_NAME)"
    HEADER_PATH="$PWD/include/$LOWERCASE_NAME.h"
    SOURCE_PATH="$PWD/src/$LOWERCASE_NAME.cpp"
}

createDir() {
    mkdir "$PWD/$1"
}

writeToFile() {
    BODY=$1
    FILE_PATH=$2
    echo "$BODY" > $FILE_PATH
}

checkForAndCreateDir() {
    if [ ! -d "$PWD/$1" ]; then
        createDir "$1"
    fi
}

createSrcAndInclude() {
    checkForAndCreateDir "src"
    checkForAndCreateDir "include"
}
