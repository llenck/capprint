CFLAGS ?= -Wall -Wextra
LDFLAGS += -lcap

SOURCES := main.c
OBJECTS := $(patsubst %.c,%.o,$(SOURCES))
HEADERS :=
EXECUTABLE := main

debug : CFLAGS += -Og -g
release : CFLAGS += -O3
debug : LDFLAGS +=
release : LDFLAGS += -O

debug: $(EXECUTABLE)
release: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) $(HEADERS)
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@

%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) $< -c

.PHONY: clean
clean:
	$(RM) $(EXECUTABLE) $(OBJECTS)
