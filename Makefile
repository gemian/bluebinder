# TODO: this is a bit minimalistic isn't it?

USE_SYSTEMD ?= 1

DESTDIR ?= /

DEPEND_LIBS = libgbinder glib-2.0
ifeq ($(USE_SYSTEMD),1)
DEPEND_LIBS += libsystemd
endif

build:
	gcc -Wall -O3 -flto bluebinder.c `pkg-config --cflags --libs $(DEPEND_LIBS)` -DUSE_SYSTEMD=$(USE_SYSTEMD) -o bluebinder

install:
	mkdir -p $(DESTDIR)/usr/sbin
	cp bluebinder $(DESTDIR)/usr/sbin

clean:
	if test -a "bluebinder"; then rm bluebinder; fi;

