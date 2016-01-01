# MakefileCore
A multi-platform multi-purpose makefile

## Defined macros
### Escapes (defined in mkcore.mk)
**SPACE** - Literally a spacebar character ( )  
**COMMA** - Literally a comma character (,)

### Project settings (defined in project/settings.mk)
**OUT_NAME** - The name of the output binary  
**OUT_TYPE** - The type of the output binary (exec for executables, dlib for dynamic link libraries, slib for static link libraries)  
**OUT_DIR** - The final output directory  
**INT_DIR** - The directory where all the .o files are placed  
**INCLUDE_DIR** - A list of include folders (where the header files are)  
**LIBRARY_FILES** - The libraries to be linked  
**LIBRARY_DIR** - A list of library folders (where the mentioned library files would be found)  
**WERR** - Treat warnings as errors  
**PIC** - Produce position independent code

### Project settings calculations (defined in mkcore.mk)
**OUT_FILE** - The output file including the path and extension  
**INC_DIRS** - The list of include directories each prepended with -I  
**LIB_DIRS** - The list of library directories each prepended with -L  
**LIB_FILES** - The list of library files each prepended with -l:  
**WERROR** - If WERR is true, is set to -Werror  
**FPIC** - If PIC is true, is set to -fpic

### Compiler specifications (defined in mkcore.mk)
**CC** - The executable used for compiling  
**LC** - The executable used for linking  
**CFLAGS** - The arguments put into compiler to produce the result based on settings  
**LFLAGS** - The arguments put into linker to produce the result based on settings

### Shorthands
**i** - Same as INT_DIR  
**COMPILER** - shorthand to specify CC CFLAGS  
**LINKER** - shorthand to specify LC LFLAGS

### Operating system specific (defined in mkcore.mk)
**SYS** - Operating system, either WIN32, LINUX or OSX  
**EXT_EXEC** - Extension for executable files in current environment  
**EXT_SLIB** - Extension for static libraries in current environment  
**EXT_DLIB** - Extension for dynamic libraries in current environment  
**EXT_WIN32** - Extension for current project type in Windows  
**EXT_LINUX** - Extension for current project type in Linux  
**EXT_OSX** - Extension for current project type in OS X  
**EXT** - Extension for current project in current environment

## Defined rules
**safeguard** - does nothing, there to prevent built-in rules from auto-triggering  
**clean** - prompts confirmation, deletes OUT_DIR and INT_DIR and then recreates them  
**clean_yes** - deletes OUT_DIR and INT_DIR and then recreates them
