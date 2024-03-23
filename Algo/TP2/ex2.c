#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Tab {
	int* tab;
	int n;
};

int main() {
    srand(time(NULL));
	int n;
    scanf("%d", &n);
    
    int* vec = malloc(n*sizeof(int));
    if (vec == NULL){
        printf("Pb d'allocation.");
        exit(1);
    }
    
    struct Tab tab = {vec, n};

    for(int i=0; i<n; i++){
        tab.tab[i]=rand()%100;
    }
    
    for(int i=0; i<n; i++){
        printf("tab.tab[i] : %d\n", tab.tab[i]);
    }
    
    int* vec2 = malloc(n*sizeof(int));
    if (vec2 == NULL){
        printf("Pb d'allocation.");
        exit(1);
    }
    struct Tab tab2 = {vec2, n};
    
    int j=0;
    for(int i=0; i<n; i++){
        if(tab.tab[i]%7 == 0) {
            tab2.tab[j]=tab.tab[i];
            j+=1;
        }
        else {
            tab.tab[i-j]=tab.tab[i];
        }
    }
    
/*
    // print les tab pour vérifier
 
    printf("\n\ntab:\n");
    for(int i=0; i<n; i++)
    {
        printf("%d\n", tab.tab[i]);
    }
    printf("\n\ntab2:\n");
    for(int i=0; i<j; i++)
    {
        printf("%d\t%s\n", tab2.tab[i], tab2.tab[i]%7 == 0 ? "true" : "false");
    }
 */
    
    // utiliser j pour réallouer correctement la mémoire tableau
    vec=realloc(vec, (n-j)*sizeof(int));
    if (vec == NULL){
        printf("Pb d'allocation.");
        exit(1);
    }
    vec2=realloc(vec2, (n-j)*sizeof(int));
    if (vec2 == NULL){
        printf("Pb d'allocation.");
        exit(1);
    }
    
    printf("\n\ntab:\n");
    for(int i=0; i<n-j; i++)
    {
        printf("%d\n", tab.tab[i]);
    }
    printf("\n\ntab2:\n");
    for(int i=0; i<j; i++)
    {
        printf("%d\t%s\n", tab2.tab[i], tab2.tab[i]%7 == 0 ? "true" : "false");
    }

	free(vec);
    free(vec2);
	exit(0);
}
