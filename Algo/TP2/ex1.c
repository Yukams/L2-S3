#include <stdio.h>
#include <stdlib.h>

int main() {
	int T[5] = {1,2,3,4,5};
	int n;
	scanf("%d", &n);
	int* vec = malloc(5*n*sizeof(int));

	if (vec == NULL){
		printf("Pb d'allocation.");
		exit(1);
	}

	for(int i=0; i<n*5; i++) {
		vec[i] = T[i%5];
		printf("T[i//5] : %d /// vec[i] : %d\n", T[i%5], vec[i]);
	}

	for(int i=0; i<5*n; i++) {
		printf("vec[i] : %d\n", vec[i]);
	}

	free(vec);
	exit(0);
}
