# Project Settings
# > Name of output file
OUT_NAME = Example
# > Type of output file (available are exec, dlib, slib)
OUT_TYPE = exec
# > Output directory (where the executables go)
OUT_DIR = ../bin
# > Intermediate directory (where the object files go)
INT_DIR = obj
# > Include directories separated by spaces (where to search for header files)
INCLUDE_DIR = include
# > List of library files to use
LIBRARY_FILES = testlib$(EXT_DLIB)
# > Library directories separated by spaces (where to search for static library files)
LIBRARY_DIR = lib
# > Treat warnings as errors (true/false)
WERR = false
# > Produce position independent code (true/false)
PIC = false
# > GCC -std argument
GCC_STD=c++11

# Project Overrides
# > Use alternate GCC executable (other than G++ on the path)
# > Commented out to use default
#GCC_EXEC = /usr/bin/i686-pc-mingw32-g++.exe