# OS Calculations
ifeq ($(OS),Windows_NT)
  SYS = WIN32
  EXT_EXEC = .exe
  EXT_SLIB = .lib
  EXT_DLIB = .dll
else
  UNAME_S := $(shell uname -s)
  ifeq ($(UNAME_S),Linux)
    SYS = LINUX
    EXT_EXEC = 
    EXT_SLIB = .a
    EXT_DLIB = .so
  endif
  ifeq ($(UNAME_S),Darwin)
    SYS = OSX
    EXT_EXEC = .app
    EXT_SLIB = .a
    EXT_DLIB = .dylib
  endif
endif
# Escapes
SPACE = 
SPACE +=
COMMA = ,