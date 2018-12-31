# C++ Build System

## Installation

*Tested on Cygwin 2.11.1*

```shell
git clone git@gitlab.com:hackerexecute/cpp-build-system.git
cd cpp-build-system
./install.sh
```

## Usage

```shell
usage: build [<option> <file_name>] [make]

    -p             creates parent directory with sub directories for a C++ project
    -n             creates namespace header and source file under src/ and include/
    -c             creates class header and source file under src/ and include/
    -s             creates struct header and source file under src/ and include/
    -h             creates single header file under include/
    make           generates template Makefile
```
