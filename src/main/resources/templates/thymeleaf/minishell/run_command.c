#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 1024

static char result_buffer[BUFFER_SIZE];

char* run_command(char** arglist) {
    char command[BUFFER_SIZE] = {0};
    for (int i = 0; arglist[i] != NULL; i++) {
        if (strlen(command) + strlen(arglist[i]) + 1 >= BUFFER_SIZE) {
            snprintf(result_buffer, BUFFER_SIZE, "Command too long");
            return result_buffer;
        }
        strcat(command, arglist[i]);
        strcat(command, " ");
    }

    FILE* fp = popen(command, "r");
    if (fp == NULL) {
        snprintf(result_buffer, BUFFER_SIZE, "Failed to run command: %.1000s", command); // 안전한 크기 제한
        return result_buffer;
    }

    memset(result_buffer, 0, BUFFER_SIZE);

    char* ptr = result_buffer;
    while (fgets(ptr, BUFFER_SIZE - (ptr - result_buffer), fp) != NULL) {
        ptr += strlen(ptr);
    }

    pclose(fp);
    return result_buffer;
}