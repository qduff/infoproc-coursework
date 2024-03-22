# Copyright (c) 1998 Cygnus Support
#
# The authors hereby grant permission to use, copy, modify, distribute,
# and license this software and its documentation for any purpose, provided
# that existing copyright notices are retained in all copies and that this
# notice is included verbatim in any distributions. No written agreement,
# license, or royalty fee is required for any of the authorized uses.
# Modifications to this software may be copyrighted by their authors
# and need not follow the licensing terms described here, provided that
# the new terms are clearly indicated on the first page of each file where
# they apply.

# The configure and make machinery for nios2 is mostly copied from
# the libnosys directory, but to avoid even more excessive cut-and-paste
# we'll use most of the .c files from that directory instead of copying
# them here.

DESTDIR =
VPATH = /cygdrive/d/intelfpga_lite/18.1/nios2eds/bin/gnu/src/newlib-2.2/libgloss/nios2:/cygdrive/d/intelfpga_lite/18.1/nios2eds/bin/gnu/src/newlib-2.2/libgloss/nios2/../libnosys
srcdir = /cygdrive/d/intelfpga_lite/18.1/nios2eds/bin/gnu/src/newlib-2.2/libgloss/nios2
objdir = .
srcroot = $(srcdir)/../..
objroot = $(objdir)/../..

prefix = /cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib
exec_prefix = ${prefix}

host_alias = nios2-elf
target_alias = nios2-elf
program_transform_name = s&^&nios2-elf-&

bindir = ${exec_prefix}/bin
libdir = ${exec_prefix}/lib
tooldir = $(exec_prefix)/$(target_alias)

# Multilib support variables.
# TOP is used instead of MULTI{BUILD,SRC}TOP.
MULTIDIRS = 
MULTISUBDIR = 
MULTIDO = true
MULTICLEAN = true

INSTALL = /bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA = ${INSTALL} -m 644

SHELL =	/bin/sh

CC = /cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/build-newlib-stage-wrapper nios2-elf-gcc -B/cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/smallc/nios2-elf/newlib/ -isystem /cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/smallc/nios2-elf/newlib/targ-include -isystem /cygdrive/d/intelfpga_lite/18.1/nios2eds/bin/gnu/src/newlib-2.2/newlib/libc/include -B/cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/smallc/nios2-elf/libgloss/nios2 -L/cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/smallc/nios2-elf/libgloss/libnosys -L/cygdrive/d/intelfpga_lite/18.1/nios2eds/bin/gnu/src/newlib-2.2/libgloss/nios2   

#AS = /cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/build-newlib-stage-wrapper nios2-elf-as
AS = `if [ -f ${objroot}/../gas/as-new ] ; \
	then echo ${objroot}/../gas/as-new ; \
	else echo as ; fi`

AR = /cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/build-newlib-stage-wrapper nios2-elf-ar

#LD = nios2-elf-ld
LD = `if [ -f ${objroot}/../ld/ld-new ] ; \
	then echo ${objroot}/../ld/ld-new ; \
	else echo ld ; fi`

RANLIB = /cygdrive/d/Uni/Year-2/InfoProc/Group_Proj/group_proj/software/groupProj_bsp/newlib-build-tmp/build-newlib-stage-wrapper nios2-elf-ranlib

OBJDUMP = `if [ -f ${objroot}/../binutils/objdump ] ; \
	then echo ${objroot}/../binutils/objdump ; \
	else t='$(program_transform_name)'; echo objdump | sed -e $$t ; fi`
OBJCOPY = `if [ -f ${objroot}/../binutils/objcopy ] ; \
	then echo ${objroot}/../binutils/objcopy ; \
	else t='$(program_transform_name)'; echo objcopy | sed -e $$t ; fi`

# 2014-06-09 jprother@altera.com:
# Below is AlteraSpecific, ported directly from Altera newlib-1.16, replacing
#
# OBJS = chown.o close.o environ.o errno.o execve.o fork.o fstat.o \
#	getpid.o gettod.o isatty.o kill.o link.o lseek.o open.o \
#	read.o readlink.o sbrk.o stat.o symlink.o times.o unlink.o \
#	wait.o write.o _exit.o
#
OBJS = \
	nosys_execve.o  \
	nosys_envlock.o  \
	nosys_fork.o \
	nosys_getpid.o  \
	nosys_gettod.o  \
	nosys_kill.o  \
	nosys_link.o  \
	nosys_sbrk.o  \
	nosys_wait.o \
	nosys_mlock.o \
	_zero_bss.o

# 2014-06-09 jprother@altera.com:
# Below is AlteraSpecific, ported directly from Altera newlib-1.16, replacing
#
# EVALOBJS = ${OBJS} _zero_bss.o nosys_crt0.o nosys_rename.o nosys_mlock.o
#
EVALOBJS = \
	${OBJS} \
	nosys_close.o  \
	nosys_crt0.o \
	nosys_environ.o  \
	nosys_exit.o  \
	nosys_fstat.o \
	nosys_isatty.o \
	nosys_lseek.o  \
	nosys_open.o  \
	nosys_read.o  \
	nosys_rename.o \
	nosys_stat.o \
	nosys_times.o  \
	nosys_unlink.o \
	nosys_write.o \


CRT0 = crt0.o

STACKOBJS = _stack.o

GCC_LDFLAGS = `if [ -d ${objroot}/../gcc ] ; \
	then echo -L${objroot}/../gcc ; fi`

OUTPUTS = ${CRT0} libnosys.a libstack.a 

NEWLIB_CFLAGS = `if [ -d ${objroot}/newlib ]; then echo -I${objroot}/newlib/targ-include -I${srcroot}/newlib/libc/include; fi`
NEWLIB_LDFLAGS = `if [ -d ${objroot}/newlib ]; then echo -B${objroot}/newlib/ -L${objroot}/newlib/; fi`

INCLUDES = -I. -I$(srcdir)/..
# Note that when building the library, ${MULTILIB} is not the way multilib
# options are passed; they're passed in $(CFLAGS).
CFLAGS_FOR_TARGET = ${MULTILIB} ${INCLUDES} ${NEWLIB_CFLAGS}
LDFLAGS_FOR_TARGET = ${MULTILIB} ${NEWLIB_LDFLAGS}
AR_FLAGS = qc

# Added this 2014-11-15 per CASE:245284
# Multilib flags (-pg, -mhw-mulx ...) are normally passed only to
# nios2-elf-gcc and nios2-elf-g++, but now that the toolchain
# supports both nios2:r1 and nios2:r2 encodings, we also need to
# pass the -march=r2 multilib flag through to nios2-elf-as, otherwise
# crt0.s and _stack.s do not get assembled in the right encoding for
# each multilib.  We cannot just pass all the C/C++ multilib flags to
# the assembler because -pg etc are not recognized by the assembler:
# the only multilib flag recognized by the assembler is -march=r2.
# So here we copy (only) that flag from CFLAGS to a new MULTILIB_ASFLAGS
# which we then pass to the assembler in the below .s.o rule:
#
ifneq (,$(findstring march=r2,$(CFLAGS)))
MULTILIB_ASFLAGS := -march=r2
else
MULTILIB_ASFLAGS := 
endif

.c.o:
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(INCLUDES) -c $(CFLAGS) $<

.C.o:
	$(CC) $(CFLAGS_FOR_TARGET) -O2 $(INCLUDES) -c $(CFLAGS) $<

.s.o:
	$(AS) $(ASFLAGS_FOR_TARGET) $(MULTILIB_ASFLAGS) $(INCLUDES) $(ASFLAGS) -o $*.o $<

#
# GCC knows to run the preprocessor on .S files before it assembles them.
#
.S.o:
	$(CC) $(CFLAGS_FOR_TARGET) $(INCLUDES) $(CFLAGS) -c $<

#
# this is a bogus target that'll produce an assembler from the
# C source with the right compiler options. this is so we can
# track down code generation or debug symbol bugs.
#
.c.s:
	$(CC) $(CFLAGS_FOR_TARGET) -S $(INCLUDES) $(CFLAGS) $<

all: ${OUTPUTS}

#
# here's where we build the library for each target
#

libnosys.a: $(EVALOBJS)
	${AR} ${ARFLAGS} $@ $(EVALOBJS)
	${RANLIB} $@

libstack.a: $(STACKOBJS)
	${AR} ${ARFLAGS} $@ $(STACKOBJS)
	${RANLIB} $@

doc:	

clean mostlyclean:
	rm -f $(OUTPUTS) *.i *~ *.o *-test *.srec *.dis *.map *.x

distclean maintainer-clean realclean: clean
	rm -f Makefile config.status $(OUTPUTS)

.PHONY: install info install-info clean-info
install:
	@for outputs in ${OUTPUTS}; do\
	 mkdir -p $(DESTDIR)$(tooldir)/lib${MULTISUBDIR}; \
	 $(INSTALL_PROGRAM) $${outputs} $(DESTDIR)$(tooldir)/lib${MULTISUBDIR}; \
	done

info:
install-info:
clean-info:

Makefile: Makefile.in config.status /cygdrive/d/intelfpga_lite/18.1/nios2eds/bin/gnu/src/newlib-2.2/libgloss/nios2/../config/default.mh
	$(SHELL) config.status

config.status: configure
	$(SHELL) config.status --recheck
