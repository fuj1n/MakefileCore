.SILENT:

include settings.mk
include ../util.mk
# Calculated Project Settings
OUT_FILE = $(OUT_DIR)/$(OUT_NAME)$(EXT)
INC_DIRS = $(subst $(SPACE), -I, $(INCLUDE_DIR))
ifeq ($(strip $(INC_DIRS)), -I)
INC_DIRS = 
endif
LIB_DIRS = $(subst $(SPACE), -L, $(LIBRARY_DIR))
ifeq ($(strip $(LIB_DIRS)), -L)
LIB_DIRS =
endif
LIB_FILES = $(subst $(SPACE), -l:, $(LIBRARY_FILES))
ifeq ($(strip $(LIB_FILES)), -l:)
LIB_FILES =
endif
ifeq ($(WERR), true)
WERROR = -Werror
endif
ifeq ($(PIC), true)
FPIC = -fpic
endif
# Compiler Specifications
CC = g++
CFLAGS = -Wall $(WERROR) $(FPIC) $(INC_DIRS) -c
ifeq ($(OUT_TYPE), slib)
LC = ar
LFLAGS = rvs $(OUT_FILE)
else
LC = g++
LFLAGS = $(LIB_DIRS) $(LIB_FILES) -o $(OUT_FILE)
ifeq ($(OUT_TYPE), dlib)
LFLAGS += -shared
else
ifeq ($(OUT_TYPE), exec)
endif
endif
endif

# Generates directories for final binary and for object files if they are missing
FOLDER_OUT := $(shell if [ ! -d "$(OUT_DIR)" ]; then mkdir $(OUT_DIR); fi)
FOLDER_INC := $(shell if [ ! -d "$(INT_DIR)" ]; then mkdir $(INT_DIR); fi)

# Shorthand operations
i = $(INT_DIR)
COMPILER = $(CC) $(CFLAGS)
LINKER = $(LC) $(LFLAGS)

include build.mk

# In place to make sure that the clean rule is never default
safeguard: 
clean: 
	echo "Are you sure you want to delete everything in output and intermediate directories? Y for yes, anything else assumed no."
	read mkcfm ; \
	if [ "$$mkcfm" == "Y" ]; then \
		echo "Removing $(OUT_DIR)"; \
		rm -f -r -d $(OUT_DIR); \
		echo "Recreating $(OUT_DIR)"; \
		mkdir $(OUT_DIR); \
		echo "Removing $(INT_DIR)"; \
		rm -f -r -d $(INT_DIR); \
		echo "Recreating $(INT_DIR)"; \
		mkdir $(INT_DIR); \
	fi
clean_yes:
		echo "Removing $(OUT_DIR)"; \
		rm -f -r -d $(OUT_DIR); \
		echo "Recreating $(OUT_DIR)"; \
		mkdir $(OUT_DIR); \
		echo "Removing $(INT_DIR)"; \
		rm -f -r -d $(INT_DIR); \
		echo "Recreating $(INT_DIR)"; \
		mkdir $(INT_DIR); \