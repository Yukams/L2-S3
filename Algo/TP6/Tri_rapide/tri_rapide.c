#include "tri_rapide.h"

void doSwitch(int* T, int m, int n) {
    int tmp = T[m];
    T[m] = T[n];
    T[n] = tmp;
}


int partitionner(int* T, int ind_premier, int ind_dernier) {
  /* A completer */
    int ind_pivot = ind_premier;
    int valPivot = T[ind_pivot];
    int j = ind_dernier;
    
    while (ind_pivot < j) {
        if (valPivot >= T[ind_pivot + 1]) {
            doSwitch(T, ind_pivot + 1, ind_pivot);
            ind_pivot += 1;
        } else {
            doSwitch(T, j, ind_pivot+1);
            j -= 1;
        }
    }

    return ind_pivot;
}


void tri_rapide(int* T, int ind_premier, int ind_dernier) {
    int ind_pivot;
    if(ind_premier < ind_dernier){
        ind_pivot = partitionner(T, ind_premier, ind_dernier);
        tri_rapide(T, ind_premier, ind_pivot-1);
        tri_rapide(T, ind_pivot+1, ind_dernier);
    }
}

void tri_rapide_iteratif(int* T, int taille) {
    /* A completer */
    pile_t p;
    init_pile(&p);
    empiler(&p, 0);
    empiler(&p, taille - 1);
    while(!pile_vide(&p)) {
        int ifin = sommet(&p);
        depiler(&p);
        int ideb = sommet(&p);
        depiler(&p);
        int ipivot = partitionner(T, ideb, ifin);
        if (ideb < ipivot - 1) {
            empiler(&p, ideb);
            empiler(&p, ipivot - 1);
        }
        if (ipivot + 1 < ifin) {
            empiler(&p, ipivot + 1);
            empiler(&p, ifin);
        }
    }
}



int __attribute__((weak)) main() {
    /* A completer pour tester */
    int T[10] = {1,4,-6,5,1,-3,1,-2,-4,8};
    printf("%d\n",partitionner(T, 0, 9));
    return 0;
}
