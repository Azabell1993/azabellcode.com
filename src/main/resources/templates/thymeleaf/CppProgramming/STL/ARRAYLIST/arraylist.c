#include "arraylist.h"
#include <stdio.h>
DECLARE_ARRAY_LIST(ArrayList, int);

typedef struct {
    size_t capacity;
    size_t length;
    ArrayList *list;
} int_list;

size_t list_size(int_list* list) {
    return list->length;
}

int main() {
    ArrayList list = new_ArrayList();

    // Add some elements to the list
    list.push_back(&list,1);
    list.push_back(&list,2);
    list.push_back(&list,3);

    // Print the list contents
    printf("List contents:\n");
    list.size;
    for (size_t i = 0; i < list_size(&list); i++) {
        printf("%d\n", list.at(&list, i));
    }

    // Clear the list
    list.clear(&list);

    // Add some more elements to the list
    list.push_back(&list, 4);
    list.push_back(&list, 5);

    // Print the list contents again
    printf("List contents:\n");
    for (size_t i = 0; i < list_size(&list); i++) {
        printf("%d\n", list.at(&list, i));
    }

    // Free the list
    list.free(&list);

    return 0;
}