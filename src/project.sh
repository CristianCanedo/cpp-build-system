#!/bin/bash

# Sub directories for project
SUBDIR=( "bin" "build" "include"
         "lib" "src" "test" )

buildProject() {
    createDir $FILE_NAME

    if [ $? -ne 0 ]; then
        echo "Failed to build project."
        exit 1;
    else 
        createSubDirs
        createMainCpp
    fi
}

createSubDirs() {
    for dir in "${SUBDIR[@]}"
    do
        createDir "${FILE_NAME}/${dir}"
    done
}

createMainCpp() {
SRC="$FILE_NAME/src"
cat > $SRC/main.cpp << EOL
#include <iostream>

int main(int argc, char** argv)
{
    return 0;
}
EOL
}
