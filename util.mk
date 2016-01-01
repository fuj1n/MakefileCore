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
# OS Specific Settings
ifeq ($(OUT_TYPE), exec)
EXT_WIN32 = .exe
EXT_LINUX = 
EXT_OSX = .app
else
ifeq ($(OUT_TYPE), dlib)
EXT_WIN32 = .dll
EXT_LINUX = .so
EXT_OSX = .dylib
else 
ifeq ($(OUT_TYPE), slib)
EXT_WIN32 = .lib
EXT_LINUX = .app
EXT_OSX = .a
endif
endif
endif
EXT = $(EXT_$(SYS))
# Escapes
SPACE = 
SPACE +=
COMMA = ,