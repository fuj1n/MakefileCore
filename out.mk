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