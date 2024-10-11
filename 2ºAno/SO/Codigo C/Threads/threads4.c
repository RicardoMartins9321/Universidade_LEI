#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <time.h>

void* roll_dice() {
    /*value is a local variable of rooll_dice function, which means that when the fucntion ens it's 
    removed from the stack, therefore you can't return this value to the outside.
    That is why you dinamically allocate memory for a pointer variable result and then set it equal
    to value. After you do that you can return the a void pointer (void*) result so that the it
    accepts any value for the result that is passed as the pointer inside of the main function*/
    int value = (rand() % 6) + 1;
    int* result = malloc(sizeof(int));
    *result = value;
    // printf("%d\n", value);
    printf("Thread result: %p\n", result);
    return (void*) result;
}

int main(int argc, char* argv[]) {
    int* res;
    srand(time(NULL));
    pthread_t th;
    if (pthread_create(&th, NULL, &roll_dice, NULL) != 0) {
        return 1;
    }
    if (pthread_join(th, (void**) &res) != 0) {
        return 2;
    }
    printf("Main res: %p\n", res);
    printf("Result: %d\n", *res);
    free(res);
    return 0;
}