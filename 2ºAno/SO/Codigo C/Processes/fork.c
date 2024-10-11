#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    
    int id = fork();
    int n;
    if (id == 0) {
        n = 1;
    } else {
        n = 6;
    }
    if (id != 0) {
        wait(NULL); // wait for child to finish execution
    }

    for (int i=n; i < n+5; i++) {
        printf("%d\n", i);
        fflush(stdout); // flush the buffer to printf immediately instead of waiting for the whole buffer to fill
    }
    if (id != 0) {
        printf("\n");
    }

    return 0;
}