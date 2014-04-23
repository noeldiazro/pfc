buttons : gb_common.o buttons.o
	gcc -o buttons gb_common.o buttons.o

gb_common.o : gb_common.c gb_common.h
	gcc -c gb_common.c

buttons.o : buttons.c gb_common.h
	gcc -c buttons.c