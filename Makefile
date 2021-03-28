COMPILER ?= gcc
VERSION ?= git
UNAME ?= $(shell uname)

SRCS = \
  main.c \

HDRS = \

ifeq ($(UNAME), Linux)
  BIN = edbg
  LIBS += -ludev
else
  ifeq ($(UNAME), Darwin)
    BIN = edbg
    LIBS += -framework IOKit
    LIBS += -framework Foundation
    LIBS += -framework CoreFoundation
    LIBS += -framework Cocoa
    LIBS += /usr/local/lib/libhidapi.a
    CFLAGS += -I/usr/local/include/hidapi
  else
    BIN = edbg.exe
    LIBS += -lhid -lsetupapi
  endif
endif

CFLAGS += -W -Wall -Wextra -O3 -std=gnu11
CFLAGS += -DVERSION=\"$(VERSION)\"
#CFLAGS += -fno-diagnostics-show-caret

all: $(BIN)

$(BIN): $(SRCS) $(HDRS)
	$(COMPILER) $(CFLAGS) $(SRCS) $(LIBS) -o $(BIN)

clean:
	rm -rvf $(BIN)


