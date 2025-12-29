CC	:= gcc
CFLAGS	:= -Wall -Wextra -O2 $(shell pkg-config --cflags xcb-xkb)
LIBS	:= $(shell pkg-config --libs xcb-xkb)
TARGET	:= keywars

$(TARGET): src/main.c
	$(CC) $(CFLAGS) src/main.c -o $(TARGET) $(LIBS)

clean:
	rm -f $(TARGET)
