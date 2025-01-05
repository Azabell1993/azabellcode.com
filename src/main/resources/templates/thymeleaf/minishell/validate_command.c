#include <stdbool.h>
#include <string.h>

bool validate_command(const char* cmd) {
    const char* whitelist[] = {"ls", "pwd", "whoami", "cd", "echo", NULL};
    for (int i = 0; whitelist[i] != NULL; i++) {
        if (strcmp(cmd, whitelist[i]) == 0) {
            return true;
        }
    }
    return false;
}
