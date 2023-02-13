#include <stdio.h>

extern int print();

int print() {
	printf("Hello World\n");
	return 0;
}

/*
	필수 설치 패키지
*/
// sudo apt install nasm

/*
	빌드 방법
*/
// gcc -c print.c -o print.o
// nasm -f elf64 hello.asm -o hello.o
// ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc print.o hello.o -o helloPrint
// ./helloPrint 