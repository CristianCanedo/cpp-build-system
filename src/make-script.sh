#!/bin/bash

cat > $PWD/Makefile << "EOL"
CC := g++
DEBUG := -g
LIBC := ar rsv
INCLUDE := -I include
CPPFLAGS := -c -Wall

BIN_DIR := bin
OBJ_DIR := build
INC_DIR := include
LIB_DIR := lib
SRC_DIR := src
TEST_DIR := test

RUNNER := $(BIN_DIR)//runner.exe
LIB_NAME := libexample.a
LIB := $(LIB_DIR)//$(LIB_NAME)
SRCS := $(wildcard $(SRC_DIR)//*.cpp)
OBJS := $(patsubst $(SRC_DIR)//%.cpp, $(OBJ_DIR)//%.o, $(SRCS))

exe: $(RUNNER)

$(RUNNER): $(OBJS)
    $(CC) -o $@ $(DEBUG) $^

lib: $(LIB)

$(LIB): $(OBJS)
	$(LIBC) $@ $^
	@echo Compilation success

$(OBJ_DIR)//%.o: $(SRC_DIR)//%.cpp
    $(CC) -o $@ $(DEBUG) $(INCLUDE) $(CPPFLAGS) $<


# Build Tests

TEST_BUILD_DIR := $(TEST_DIR)//build
TEST_SRCS := $(wildcard $(TEST_DIR)//*.cpp)
TEST_OBJS := $(patsubst $(TEST_DIR)//%.cpp, $(TEST_BUILD_DIR)//%.o, $(TEST_SRCS))
TEST_RUNNER := $(TEST_DIR)//runner

tests: $(TEST_OBJS)
	$(CC) $^ -o $(TEST_RUNNER)

$(TEST_BUILD_DIR)//%.o: $(TEST_DIR)//%.cpp
    $(CC) -o $@ $(INCLUDE) $(CPPFLAGS) $<

.PHONY: clean
clean:
	@echo Cleaning object files...
	rm -rf $(OBJ_DIR)//*.o

tclean:
	@echo Cleaning test object files...
	rm -rf $(TEST_BUILD_DIR)//*.o

update:
    @echo Moving $(LIB_NAME) to c++ search path...
    cp -f $(LIB) /usr/lib/
	@echo Done.
	@echo
	@echo Moving header files to c++ search path...
	cp -f include/*.h /usr/include/
	@echo Done.
EOL
