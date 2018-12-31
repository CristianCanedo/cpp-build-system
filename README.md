# C++ Build System

## Installation

*Tested on Cygwin 2.11.1*

```shell
git clone git@gitlab.com:hackerexecute/cpp-build-system.git
cd cpp-build-system
./install.sh
```

## Usage

Create a new project directory:

```shell
build -p Calculator
```
Creates Calculator parent directory with following sub directories and files:
- Calculator/bin
- Calculator/build
- Calculator/include
- Calculator/lib
- Calculator/src
- Calculator/src/main.cpp
- Calculator/test
