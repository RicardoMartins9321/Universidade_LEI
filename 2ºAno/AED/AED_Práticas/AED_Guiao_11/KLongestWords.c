//
// Algoritmos e Estruturas de Dados --- 2023/2024
//
// Joaquim Madeira, May 2020, November 2023
//

//
// This program creates a HASH TABLE that stores the words of a text file and
// the number of occurrences of each word.
//
// It also creates a MIN-HEAP that stores the K longest words of the text file.
//

//// SEARCH ... AND COMPLETE ////

// Try the arguments below.

// ARGS 5 file20.txt
// ARGS 10 file99.txt
// ARGS 20 SherlockHolmes.txt

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "HashTable.h"
#include "MinHeap.h"

//
// The MIN-HEAP stores pairs (word, length), where length is the word length.
// Examples: (dog, 3), (house, 5)
//
// The MIN-HEAP elements are orderer according to the second attribute (length).
//

// The info for each min-heap node
struct heapElem {
  char word[64];        // A word
  unsigned int length;  // Its length
};

typedef struct heapElem* heapElemPtr;

// The comparator for heap elements

int comparator(const void* p1, const void* p2) {
  heapElemPtr item1 = (heapElemPtr)p1;
  heapElemPtr item2 = (heapElemPtr)p2;

  int d = item1->length - item2->length;
  return (d > 0) - (d < 0);
}

// The printer for heap elements

void printer(void* p) {
  heapElemPtr item = (heapElemPtr)p;
  printf("(%s, %d)", item->word, item->length);
}

int main(int argc, char** argv) {
  if (argc < 3) {
    fprintf(stderr, "Usage: %s K FILE\n", argv[0]);
    exit(1);
  }

  // k -> number of words we are looking for
  unsigned int k = atoi(argv[1]);

  FILE* file = fopen(argv[2], "r");
  if (file == NULL) {
    fprintf(stderr, "Unable to open file %s\n", argv[1]);
    exit(1);
  }

  // The hash table for registering words and counting word occurrences.
  // It uses the hash3 hashing function
  HashTable* hashT = HashTableCreate(50021, hash3, linearProbing, 1);

  // The MIN-HEAP for registering K words according to their length
  MinHeap* topKByLength = MinHeapCreate(k, comparator, printer);

  // Scan the entire file
  char line[10000];
  char word[64];

  while (fgets(line, sizeof(line), file) != NULL) {
    // Replace non-digits and non-letters by a space
    for (size_t i = 0; line[i] != '\0'; i++) {
      if ((line[i] < '0' || line[i] > '9') &&
          (line[i] < 'A' || line[i] > 'Z') &&
          (line[i] < 'a' || line[i] > 'z') && line[i] != '\'') {
        line[i] = ' ';
      }
    }
    // Go again over the line and extract each word
    size_t j;
    for (size_t i = 0; line[i] != '\0'; i += j) {
      if (line[i] == ' ') {
        j = 1;
      } else {
        for (j = 0; line[i + j] != '\0' && line[i + j] != ' '; j++) {
          if (j < 63) word[j] = line[i + j];
        }
        word[(j < 63) ? j : 63] = '\0';

        // Update the HASH TABLE with the occurrence of the current word
        if (HashTableIncrement(hashT, word) == 0) {
          // If the word is not already in the hash table, insert it
          HashTablePut(hashT, word, 1);
        }

        // Update the MIN-HEAP, if needed
        heapElemPtr p;
        if (MinHeapSize(topKByLength) != k) {
          // Add to the MIN-HEAP until it has k elements

          // Allocate the new heap element and set its attributes
          heapElemPtr newElement = (heapElemPtr)malloc(sizeof(struct heapElem));
          if (newElement == NULL) {
            fprintf(stderr, "Memory allocation error\n");
            exit(1);
          }
          strncpy(newElement->word, word, sizeof(newElement->word));
          newElement->length = strlen(word);

          // Add it to the MIN-HEAP
          MinHeapInsert(topKByLength, newElement);

        } else if (HashTableGet(hashT, word) == 1) {
          // The MIN-HEAP has K elements
          // AND the current word just appeared for the first time
          // Replace the min element of the heap, if the word is longer
          // than the min word

          p = MinHeapGetMin(topKByLength);

          // If the current word is longer than the min word
          if (strlen(word) > p->length) {
            // Remove the min element from the heap
            MinHeapRemoveMin(topKByLength);

            // Free its allocated memory
            free(p);

            // Allocate the new heap element and set its attributes
            heapElemPtr newElement = (heapElemPtr)malloc(sizeof(struct heapElem));
            if (newElement == NULL) {
              fprintf(stderr, "Memory allocation error\n");
              exit(1);
            }
            strncpy(newElement->word, word, sizeof(newElement->word));
            newElement->length = strlen(word);

            // Add it to the MIN-HEAP
            MinHeapInsert(topKByLength, newElement);
          }
        }
      }
    }
  }

  // Closing the file
  fclose(file);

  // List the words in ascending order
  printf("*** The %u longest words ***\n", k);

  // Loop to print and remove the min element from the heap,
  // and free its allocated memory
  while (!MinHeapIsEmpty(topKByLength)) {
    heapElemPtr p = MinHeapGetMin(topKByLength);
    printf("(%s, %d)\n", p->word, p->length);
    MinHeapRemoveMin(topKByLength);
    free(p);
  }

  // Freeing the allocated memory
  HashTableDestroy(&hashT);
  MinHeapDestroy(&topKByLength);

  return 0;
}