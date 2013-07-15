###############################################################################
# USAGE:
# Variables that must be defined in including makefile.
#   PROJECT: Name to be given to the output binary for this project.
#   SRC: The root directory for the sources of your project.
#   GCC4MED_DIR: The root directory for where the gcc4mbed sources are located
#                in your project.  This should point to the parent directory
#                of the build directory which contains this gcc4mbed.mk file.
#   LIBS_PREFIX: List of library/object files to prepend to mbed.ar capi.ar libs.
#   LIBS_SUFFIX: List of library/object files to append to mbed.ar capi.ar libs.
#   COMPILER_OUTPUT: Type of build to produce.  Allowed values are:
#                  Debug - Build for debugging.  Disables optimizations and
#                          links in debug MRI runtime.  Best debugging 
#                          experience.
#                  Release - Build for release with no debug support.
#                  Checked - Release build with debug support.  Due to
#                            optimizations, debug experience won't be as good
#                            as Debug but might be needed when bugs don't
#                            reproduce in Debug builds.
#                  default: Release
#   MRI_BREAK_ON_INIT: Should the program halt before calling into main(),
#                      allowing the developer time to set breakpoints in main()
#                      or in code run from within global constructors.
#                      default: 1 - break on init.
#   MRI_SEMIHOST_STDIO: Set to non-zero value to allow debug monitor to use
#                       semi-host calls to redirect stdin/stdout/stderr to the
#                       gdb console.
#                       default: 1 for Debug/Checked builds and 0 for Release.
#   MRI_UART: Select the UART to be used by the debugger.  See mri.h for
#             allowed values.
#             default: MRI_UART_MBED_USB - Use USB based UART on the mbed.
#	SWIGFLAGS: [-ruby*, -java, etc]
# Example makefile:
#       PROJECT=HelloWorld
#       SRC=.
#       GCC4MBED_DIR=../..
#       LIBS_PREFIX=../agutil/agutil.ar
#       LIBS_SUFFIX=
#
#       include ../../build/gcc4mbed.mk
#      
###############################################################################
# Check for undefined variables.

# Check for undefined variables.
ifndef PROJECT
$(error makefile must set PROJECT variable.)
endif

ifndef SINELABORE_DIR
$(error makefile must set SINELABORE_DIR.)
endif
OS = cygwin

ifeq "$(OS)" "Windows_NT"
REMOVE = del
SHELL=cmd.exe
REMOVE_DIR = rd /s /q
MKDIR = mkdir
QUIET=>nul 2>nul & exit 0
RM = del /Q
FixPath = $(subst /,\,$1)
else
REMOVE = rm
REMOVE_DIR = rm -r -f
MKDIR = mkdir -p
QUIET=> /dev/null 2>&1 ; exit 0
RM = rm -f
FixPath = $(subst \,/,$1)
endif


# Compiler position
GCC ?= gcc
GPP ?= g++

SRC = ./src
SHAREDINCLUDES = ./sharedobjects
SHARED = ./sharedobjects
LIBMODULES =
COMPILER_OUTPUT ?= Release
CODEGEN_DIR ?= $(SINELABORE_DIR)
SWIGINCLUDE ?= -I/usr/lib/ruby/1.8/i386-cygwin
#GCOVFLAGS = -ftest-coverage -fprofile-arcs
#otherswitches ?= -Wl,--enable-auto-image-base,--enable-auto-import,--export-all   -lruby  -lrt -ldl -lcrypt
otherswitches ?= 
INSTALLDIR ?= /usr/lib/ruby/site_ruby/1.8/i386-cygwin
#LDSHARED = gcc -shared $(TESTFLAG)
#CFLAGS = -Wall -O2 -pipe -fno-strict-aliasing -c $(TESTFLAG)
SWIG = swig
SWIGFLAGS ?= -ruby
INSTALL = /usr/bin/install
INSTALLSWITCHES = -c -m 0755


# Configure MRI variables based on COMPILER_OUTPUT build type variable.
ifeq "$(COMPILER_OUTPUT)" "Release"
OPTIMIZATION ?= 2
endif


ifeq "$(COMPILER_OUTPUT)" "Debug"
OPTIMIZATION = 0
DBG = -g3
endif


ifeq "$(COMPILER_OUTPUT)" "Checked"
OPTIMIZATION ?= 2
DBG = -g3
endif



# List of sources to be compiled/assembled
CSRCS = $(wildcard $(SRC)/*.c $(SRC)/*/*.c $(SRC)/*/*/*.c $(SRC)/*/*/*/*.c $(SRC)/*/*/*/*/*.c)
CPPSRCS = $(wildcard $(SRC)/*.cpp $(SRC)/*/*.cpp $(SRC)/*/*/*.cpp $(SRC)/*/*/*/*.cpp $(SRC)/*/*/*/*/*.cpp)
CDDSRCS = $(wildcard $(SRC)/*.cdd $(SRC)/*/*.cdd $(SRC)/*/*/*.cdd $(SRC)/*/*/*/*.cdd $(SRC)/*/*/*/*/*.cdd)
SWIGSRCS = $(wildcard $(SRC)/*.i $(SRC)/*/*.i $(SRC)/*/*/*.i $(SRC)/*/*/*/*.i $(SRC)/*/*/*/*/*.i)
SHAREDSRCS = $(wildcard $(SHARED)/*.c)



# List of the objects files to be compiled/assembled
OBJECTS = $(patsubst %.cdd,%.o,$(CDDSRCS)) $(patsubst %.c,%.o,$(CSRCS)) $(patsubst %.cpp,%.o,$(CPPSRCS))
SWIGOBJECTS = $(patsubst %.i,%_wrap.o,$(SWIGSRCS))
SHAREDOBJECTS = $(patsubst %.c,%.o,$(SHAREDSRCS))

#list of intermediate file produced by codegen
CODEGEN_OUTPUT = $(patsubst %.cdd,%.c,$(CDDSRCS)) $(patsubst %.cdd,%.h,$(CDDSRCS)) $(patsubst %.cdd,%_ext.h,$(CDDSRCS)) $(patsubst %.cdd,%_dbg.h,$(CDDSRCS))

#list of intermediate file produced by swig
SWIG_OUTPUT = $(patsubst %.i,%_wrap.c,$(SWIGSRCS) %.i,%_wrap.o,$(SWIGSRCS))


# List of the header dependency files, one per object file.
DEPFILES = $(patsubst %.o,%.d,$(OBJECTS))


# Include path which points to external library headers and to subdirectories of this project which contain headers.
SUBDIRS = $(wildcard $(SRC)/* $(SRC)/*/* $(SRC)/*/*/* $(SRC)/*/*/*/* $(SRC)/*/*/*/*/*)
PROJINCS = $(sort $(dir $(SUBDIRS)))
INCDIRS = $(PROJINCS)

# UML State Machine Diagram Translator
JAVA = java
JFLAGS = -Djava.ext.dirs=$(call FixPath,$(SINELABORE_DIR)) -jar $(call FixPath,$(SINELABORE_DIR))/codegen.jar -U $(call FixPath,$(CODEGEN_DIR))/codegen.cfg



# Compiler Options
GPFLAGS ?= $(DBG) -Wall -O$(OPTIMIZATION)
GPFLAGS += $(patsubst %,-I%,$(INCDIRS))
GPFLAGS += -Wall -Wextra -Wno-unused-parameter -Wcast-align -Wpointer-arith -Wredundant-decls -Wcast-qual -Wcast-align
#GPFLAGS += $(CFLAGS)
GCFLAGS = $(GPFLAGS)



.PHONY: all clean deploy

all:: $(PROJECT).exe $(PROJECT).so $(PROJECT).dll

$(PROJECT).so : $(OBJECTS) $(SWIGOBJECTS) $(SHAREDOBJECTS)
	gcc $(GCOVFLAG) -shared $(OBJECTS) $(SHAREDOBJECTS) $(SWIGOBJECTS) $(otherswitches) -o $@
	$(INSTALL) $(INSTALLSWITCHES) $@ $(INSTALLDIR) 

$(PROJECT).dll : $(OBJECTS) $(SWIGOBJECTS) $(SHAREDOBJECTS)
	gcc $(GCOVFLAG) -shared $(OBJECTS) $(SHAREDOBJECTS) $(SWIGOBJECTS) $(otherswitches) -o $@
	$(INSTALL) $(INSTALLSWITCHES) $@ $(INSTALLDIR) 


$(PROJECT).exe:	$(OBJECTS) main.o
	$(GCC) $(GCOVFLAG) $(DBG) -o $(PROJECT).exe $(OBJECTS) main.o

clean:
	$(REMOVE) -f $(call FixPath,$(SWIG_OUTPUT)) $(QUIET)
	$(REMOVE) -f $(call FixPath,$(CODEGEN_OUTPUT)) $(QUIET)
	$(REMOVE) -f $(call FixPath,$(SWIGOBJECTS)) $(QUIET)
	$(REMOVE) -f $(call FixPath,$(SHAREDOBJECTS)) $(QUIET)
	$(REMOVE) -f $(call FixPath,$(OBJECTS)) $(QUIET)
	$(REMOVE) -f $(call FixPath,$(DEPFILES)) $(QUIET)
	$(REMOVE) -f main.o $(QUIET)
	$(REMOVE) -f $(PROJECT).o $(QUIET)
	$(REMOVE) -f $(PROJECT).exe $(QUIET)
	$(REMOVE) -f $(PROJECT).so $(QUIET)
	find . -name "*.gcno" -print0 | xargs -0 rm -rf
	find . -name "*.gcda" -print0 | xargs -0 rm -rf
	find . -name "*.o" -print0 | xargs -0 rm -rf
	find . -name "*.exe" -print0 | xargs -0 rm -rf
	find . -name "*.so" -print0 | xargs -0 rm -rf

#include $(DEPFILES)


#########################################################################
#  Default rules to compile .c and .cpp file to .o
#  and assemble .s files to .o


%.o : %.cpp
	$(GPP) $(GCOVFLAG) $(GPFLAGS) -c $< -o $@

%.o : %.c
	$(GCC) $(GCOVFLAG) $(GCFLAGS) -c $< -o $@

%.o : %.cdd %.cfg
	$(JAVA) $(JFLAGS) -p CADIFRA -U $(basename $<).cfg  -o $(basename $<)  $<
	$(GCC) $(GCOVFLAG) $(GCFLAGS) -c $(basename $<).c -o $@

%_wrap.o	: %.i
	$(SWIG) $(SWIGFLAGS) $<
	$(GCC) $(GCOVFLAG) $(DBG) -Wall -O$(OPTIMIZATION) -pipe -fno-strict-aliasing $(TESTFLAG) $(SWIGINCLUDE) -I$(SHAREDINCLUDES) -c $(basename $<)_wrap.c -o $@
	

#########################################################################
