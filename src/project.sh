#!/bin/bash

# Sub directories for project
SUBDIR=( "bin" "build" "include"
         "lib" "src" "test" )

PARENT=""

build_project() {
    PARENT="$PWD/$1"
    mkdir $PARENT
    if [ $? -ne 0 ]; then
        echo "Failed to build project."
        exit 1;
    else 
        create_subdirs
        create_src_main
    fi
}

create_subdirs() {
    for dir in "${SUBDIR[@]}"
    do
        mkdir "${PARENT}/${dir}"
    done
}

create_src_main() {
SRC="$PARENT/src"
cat > $SRC/main.cpp << EOL
#include <iostream>

int main(int argc, char** argv)
{
    return 0;
}
EOL
}
