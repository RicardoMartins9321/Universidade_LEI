#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

/*Don´t Forget, threads have shared memory so you can pass arguments around the place with different
names in each place, that's the case for r, that first begins as 'a' that is dinnamicaly allocated
memmory, that is then passed inside of thread create to the routine function, where it is used as
the index, and then it is passed back to the main function as 'r' and then it is freed. So we have
2 mallocs total one for each i, so we need to have atleast 2 free memories
*/

int primes[10] = { 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 };

void* routine(void* arg) {
    int index = *(int*)arg;
    int sum = 0;
    for (int j = 0; j < 5; j++) {
        sum += primes[index + j];
    }
    printf("Local sum: %d\n", sum);
    *(int*)arg = sum;
    return arg;
}

int main(int argc, char* argv[]) {
    pthread_t th[2];
    int i;
    for (i = 0; i < 2; i++) {
        int* a = malloc(sizeof(int));
        *a = i * 5;
        if (pthread_create(&th[i], NULL, &routine, a) != 0) {
            perror("Failed to create thread");
        }
    }
    int globalSum = 0;
    for (i = 0; i < 2; i++) {
        int* r;
        if (pthread_join(th[i], (void**) &r) != 0) {
            perror("Failed to join thread");
        }
        globalSum += *r;
        free(r);
    }
    printf("Global sum: %d\n", globalSum);
    return 0;
}