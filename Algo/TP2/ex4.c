#include <stdlib.h>
#include <stdio.h>
#include <time.h>

int main() {
    srand(time(NULL));
    
    int n;
    int* T;
    T = malloc(10*sizeof(int));
    if(T == NULL) {
        printf("Pb d'allocation");
        exit(1);
    }
    
    printf("\nDonnez un nombre (entre 0 et 10) : ");
    scanf("%d", &n);
    
    if(n>10 || n<0) {
        printf("\nErreur : nombre fourni invalide\n");
        exit(1);
    }

    for(int i=0; i<10; i++) {
        if(i<n) {
            T[i] = rand()%10;
        }
        else {
            T[i] = 0;
        }
    }
    
    // print tab
    printf("Tab avant modif :\n");
    for(int i=0; i<10; i++) {
        printf("%d ", T[i]);
    }
    
    
    // Inversion du tableau
    int temp;
    int limite = n/2;
    for(int i=0; i<limite; i++) {
        temp = T[i];
        T[i] = T[n-1-i];
        T[n-1-i] = temp;
    }
    
    
    // print tab
    printf("\n\nTab après modif :\n");
    for(int i=0; i<10; i++) {
        printf("%d ", T[i]);
    }
    printf("\n");
    
    free(T);
    
    exit(0);
}
