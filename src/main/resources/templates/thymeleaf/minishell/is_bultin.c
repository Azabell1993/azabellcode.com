#include <stdbool.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

void cd_func(char** arg);

struct b_cmd {
    char *cmd;
    void (*func)(char**);
} builtin_cmd[] = {
    {"cd", cd_func},
    {NULL, NULL}
};

int is_builtin(char** arg)
{
    for (int i = 0; builtin_cmd[i].cmd != NULL; i++) {
        if (strcmp(arg[0], builtin_cmd[i].cmd) == 0) {
            builtin_cmd[i].func(arg);
            return 1;
        }
    }
    return 0;
}

void cd_func(char** arg) {
    if (arg[1] == NULL) {
        fprintf(stderr, "cd: missing argument\n");
        return;
    }

    if (chdir(arg[1]) == -1) {
        perror("chdir");
        return;
    }

    // 디버깅용 현재 디렉토리 출력
    char cwd[1024];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        printf("Changed directory to: %s\n", cwd);
    } else {
        perror("getcwd");
    }
}