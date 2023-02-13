#include <stdio.h>
#include <string.h>
#include <stdint.h>

/*
    @ extern test function
    @ db_host printf "g"
*/
extern char *db_host_test();
extern char *db_user_test();
extern char *db_pass_test();
extern char *db_name_test();

char *db_host_test() {
    char *db_host_test = "125.128.104.134";
	long len = strlen(db_host_test);
	int ret = 0;

	__asm__("movq $1, %%rax \n\t"
		"movq $1, %%rdi \n\t"
		"movq %1, %%rsi \n\t"
		"movl %2, %%edx \n\t"
		"syscall"
		: "=g"(ret)
		: "g"(db_host_test), "g" (len));

	return 0;
}

char *db_user_test() {
    char *db_user_test = "azabellcode";
	long len = strlen(db_user_test);
	int ret = 0;

	__asm__("movq $1, %%rax \n\t"
		"movq $1, %%rdi \n\t"
		"movq %1, %%rsi \n\t"
		"movl %2, %%edx \n\t"
		"syscall"
		: "=g"(ret)
		: "g"(db_user_test), "g" (len));

	return 0;
}

char *db_pass_test() {
    char *db_pass_test = "dkwkqpf!123@Dkwiela";
	long len = strlen(db_pass_test);
	int ret = 0;

	__asm__("movq $1, %%rax \n\t"
		"movq $1, %%rdi \n\t"
		"movq %1, %%rsi \n\t"
		"movl %2, %%edx \n\t"
		"syscall"
		: "=g"(ret)
		: "g"(db_pass_test), "g" (len));

	return 0;
}

char *db_name_test() {
    char *db_name_test = "azabellcode";
	long len = strlen(db_name_test);
	int ret = 0;

	__asm__("movq $1, %%rax \n\t"
		"movq $1, %%rdi \n\t"
		"movq %1, %%rsi \n\t"
		"movl %2, %%edx \n\t"
		"syscall"
		: "=g"(ret)
		: "g"(db_name_test), "g" (len));

	return 0;
}

char *test() {
    char *c = "jeewooworldblue";
    char d = sizeof(c);
    char *e = c;

    asm ("mov %[e], %[d]"
    : [d] "=rm" (d)
    : [e] "rm" (*e));
    
    return e;
}

int main() {
    db_host_test();  printf("\n");
    db_user_test();  printf("\n");
    db_pass_test();  printf("\n");
    db_name_test();  printf("\n");

    printf("%s\n", test());
	return 0;
}