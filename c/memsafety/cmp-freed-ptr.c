#include <stdlib.h>

int main() {

    struct T {
        struct T* next;
    };

    struct T* x = NULL;
    struct T* y = NULL;

    y = malloc(sizeof(*y));
    __intptr_t adressY = (__intptr_t) y;

    free(y);

    x = malloc(sizeof(*x));
    __intptr_t adressX = (__intptr_t) x;

    if (adressX == adressY)
    { // if the second malloc returns the same value as the first, I should get here
        free(x);
    }

    free(x);

    return 0;
}

// predator-regre/test-0238.c
// - comparing freed pointers
// - contributed by Ondra Lengal
