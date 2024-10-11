#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

/*threads share memory therefore even if you just change the variable inside of specific 
    thread routine, the other routine will still use the updated variable value and not the initial value*/

/*But now you must worry about race conditions*/

int mails = 0; 
pthread_mutex_t mutex;

void* routine1() {
    mails++;
    sleep(1);
    printf("Value of emails routine1: %d\n", mails);
}
void* routine2() {
    sleep(1);
    printf("Value of emails of routine2: %d\n", mails);
}
void routine3() {
    for (int i=0; i < 1000000; i++) {
        pthread_mutex_lock(&mutex); // lock the mutex
        mails++;
        pthread_mutex_unlock(&mutex);   // unlock the mutex

        /*mails++ implementation extended explanation
            first read the memory position for the variable mails and get it's value
            then increment the value
            and finally write the new value to the memory positon allocated for the mail variable

        The larger the number of iterations you put the more likely you are to run into a error
        because what the code below for does, is it first creates a thread and performs the actions
        inside of the routine, if the number of actions is small enough that they can be done under
        a second or so then that piece of code finishes before the second thread gets created.
        The problem is that if the number is large enough then you are still going to be running one
        thread routine while the other is also running at the same time and applying changes on their
        shared memory, and so values will be random as they will depend on the time it's taking to run each.
        
        To solve this problem of race conditions we must first define what the critical region of our code is.
        This is the region where we are manipulating the shared values, which cannot be executed/accessed
        by more than one thread: Our critical region in this case it's the for loop.
        Then we can implement what is called a mutex which will garantee the mutual exclusion access to the critical region
        by the threads, meaning that only one thread can access the critical region at a time, and so we can garantee that
        the value of the variable will be updated correctly.

        A mutex is a lock that we can put on a piece of code, and only one thread can hold the lock at a time, this lock
        can be a simple int variable defined in our code that only needs to support the operations for up - increment and
        down - decrement, and if the value is 0 then the thread will wait until the value is 1 again, and if the value is 1
        then the thread will decrement the value and enter the critical region, and when it's done it will increment the value
        from 0 back to 1 and leave the critical region, and so the other thread can enter the critical region and so on.

        We can also use the pthread_mutex_init() ; destroy(), pthread_mutex_lock() and pthread_mutex_unlock() functions 
        from the pthread library to initialize ; destroy ; lock and unlock the mutex
        */
    }
}

int main(int argc, char *argv[]) {
    pthread_t t1, t2;  // thread identifier 
    pthread_mutex_init(&mutex, NULL);   // initialize the mutex

    if (pthread_create(&t1, NULL, &routine3, NULL) != 0) {
        perror("An error occured while creating the thread1");
        return 1;
    }
    if (pthread_create(&t2, NULL, &routine3, NULL) != 0) {
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

    printf("Value of emails: %d ; expected value: 2000000\n", mails);

    pthread_mutex_destroy(&mutex);  // destroy the mutex
    return 0;
}