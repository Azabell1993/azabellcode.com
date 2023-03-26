#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <stdlib.h>

#define lambda(return_type, function_body) \
({ \
  return_type __fn__ function_body \
  __fn__; \
})

static size_t lamda_parser_keyword(char *keyword) {
    size_t len = strlen("->");
    memcpy(keyword, "->", len + 1);
    return len;
}

static char *__lamda__() {
    static char *keyword = NULL; // 이전에 할당된 포인터가 없으면 NULL
    if (keyword == NULL) { // 이전에 할당된 포인터가 없으면 메모리 할당
        keyword = malloc(sizeof(char) * 3);
        if (keyword == NULL) {
            return NULL;
        }
        size_t len = lamda_parser_keyword(keyword);
        keyword[len] = '\0';
    }
    return keyword;
}
int main() {
    char *(*__lamda__)(void) = lambda(char *, () { return __lamda__(); });

    char *result = __lamda__();
    if (result == NULL) {
        printf("Failed to allocate memory for keyword.\n");
        return 1;
    }

    printf("%s\n", result);

    free(result);
    return 0;
}