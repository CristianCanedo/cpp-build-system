#!/bin/bash

usage() {
cat << EOF
usage: build [<option> <file name>]

    -p              build project with parent directory and sub directories
    -ns             build namespace src/ and include/ files
    -c              build class src/ and include/ files
    -s              build struct src/ and include/ files
    -h              build single header file under include/
    -sr             build single source file under src/

EOF
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

OPTIND=1 # Reset in case previously used in shell

# File names to source
PROJECT="project.sh"
NAMESPACE="namespace.sh"
CLASS="class.sh"
STRUCT="struct.sh"
HEADER="header.sh"
SOURCE="source.sh"

# Process arguments
while getopts ":p:ns:c:s:h:sr:" opt; do
    case "$opt" in
        p)
            . $PWD/$PROJECT
            build_project $OPTARG; exit 0;;
        ns)
            . $PWD/$NAMESPACE
            build_namespace $OPTARG; exit 0;;
        c)
            . $PWD/$CLASS
            build_class $OPTARG; exit 0;;
        s)
            . $PWD/$STRUCT
            build_struct $OPTARG; exit 0;;
        h)
            . $PWD/$HEADER
            build_header $OPTARG; exit 0;;
        sr)
            . $PWD/$SOURCE
            build_source $OPTARG; exit 0;;
        : )
            echo "Missing option argument for -$OPTARG" >&2; exit 1;;
        *)
            usage; exit 1;;
    esac
done

