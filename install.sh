#!/bin/bash

TARGET_DIR="/usr/local/bin/buildsystem"
HOME_BIN="$HOME/bin"

# Create project directory under /usr/local/bin
if [ -d "$TARGET_DIR" ]; then
    echo "Unable to install buildsystem. Directory already exists."
    exit 1;
else
    mkdir "$TARGET_DIR"
fi

# Move src/ into newly created project directory
cp -r src/ $TARGET_DIR/

# Create symlink under $HOME/bin
if [ ! -d "$HOME_BIN" ]; then
    mkdir "$HOME_BIN"
fi

ln -s "$TARGET_DIR/src/build.sh" "$HOME_BIN/build"

# Check if symlink was created properly
if [ -e "$HOME_BIN/build" ]; then
    if [ -L "$HOME_BIN/build" ]; then
        echo "Installation finished successfully."
        exit 0
    else
        echo "Something went wrong when creating symlink. Installation failed."
        exit 1
    fi
else
    echo "Something went wrong when creating symlink. Installation failed."
    exit 1
fi
