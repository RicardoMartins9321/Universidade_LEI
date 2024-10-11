#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

void* routine() {
    printf("Hello from thread\n");
    sleep(2);
    printf("Bye from thread\n");
}

int main(int argc, char *argv[]) {
    pthread_t t1, t2;  // thread identifier 
    if (pthread_create(&t1, NULL, &routine, NULL) != 0) {
        perror("An error occured while creating the thread1");
        return 1;
    }
    if (pthread_create(&t2, NULL, &routine, NULL) != 0) {
        perror("An error occured while creating the thread2");
        return 2;
    }
    if (pthread_join(t1, NULL) != 0) {
        perror("An error occured while waiting for the thread1 to finish");
        return 3;
    }
    if (pthread_join(t2, NULL) != 0) {
        perror("An error occured while waiting for the thread2 to finish");
        return 4;
    }

    return 0;
}

/* Why are threads useful:
    Think for example if the word text program could only run a single thread at a time, and it 
    must have the capabilities to let you write on the file and also correct you spelling mistakes
    if the program could only run one thread at a time, you would begin by writing your word and
    then you would have to wait for the spelling correction part of the code to finish analysing
    your word befire you could begin to write again.
    Therefore by allowing the use of multiple running threads it makes your experience uusing 
    applications much more enjoyable and smooth
*/