#include <stdlib.h>
#include <stdio.h>
#include <time.h>

// Matrice
struct Matrice {
    int nbLigne;
    int nbColonne;
    int** tab;
};

int main() {
    srand(time(NULL));
    int ligne, colonne;
    
    // Saisie matrice 1
    printf("\nPremière matrice :\n\nNb lignes ? ");
    scanf("%d", &ligne);
    printf("Nb colonnes ? ");
    scanf("%d", &colonne);

    int** tab1 = malloc(ligne*sizeof(int*));
    
    if (tab1 == NULL) {
        printf("Pb allocation");
        exit(1);
    }
    
    for(int i=0; i<ligne;i++){
        tab1[i]=malloc(colonne*sizeof(int));
        
        if (tab1[i] == NULL) {
            printf("Pb allocation");
            exit(1);
        }
    }
    
    struct Matrice matrice1 = {ligne, colonne, tab1};
    
    
    // Saisie matrice 2
    printf("\n\nDeuxième matrice :\n\nNb lignes ? ");
    scanf("%d", &ligne);
    printf("Nb colonnes ? ");
    scanf("%d", &colonne);
    
    // Si le nombre de ligne et de colonne est différent, on arrête le programme directement
    if(matrice1.nbColonne != ligne) {
        printf("\n=====\nL'opération ne peut s'effectuer\n=====\n");
        exit(1);
    }
    
    int** tab2 = malloc(ligne*sizeof(int*));
    
    if (tab2 == NULL) {
        printf("Pb allocation");
        exit(1);
    }
    
    for(int i=0; i<ligne;i++){
        tab2[i]=malloc(colonne*sizeof(int));
        
        if (tab2[i] == NULL) {
            printf("Pb allocation");
            exit(1);
        }
    }
    
    struct Matrice matrice2 = {ligne, colonne, tab2};

    
    // Remplissage aléatoire des matrices
    for(int i=0; i<matrice1.nbLigne; i++) {
        for(int j=0; j<matrice1.nbColonne; j++) {
            matrice1.tab[i][j]=rand()%3;
        }
    }
    for(int i=0; i<matrice2.nbLigne; i++) {
        for(int j=0; j<matrice2.nbColonne; j++) {
            matrice2.tab[i][j]=rand()%3;
        }
    }
    
    
    // Affichage des matrices (vérification)
    printf("Première matrice :\n");
    for(int i=0; i<matrice1.nbLigne; i++) {
        for(int j=0; j<matrice1.nbColonne; j++) {
            printf("%d ", matrice1.tab[i][j]);
        }
        printf("\n");
    }
    printf("\n\nDeuxième matrice :\n");
    for(int i=0; i<matrice2.nbLigne; i++) {
        for(int j=0; j<matrice2.nbColonne; j++) {
            printf("%d ", matrice2.tab[i][j]);
        }
        printf("\n");
    }
    
    
    // Création de la matrice produit
    ligne = matrice1.nbLigne;
    colonne = matrice2.nbColonne;
    int** tab3 = malloc(ligne*sizeof(int*));
    int somme;
    
    for(int i=0; i<ligne;i++){
        tab3[i]=malloc(colonne*sizeof(int));
        
        if (tab3[i] == NULL) {
            printf("\nPb allocation\n");
            exit(1);
        }
    }
    
    struct Matrice matriceProduit = {ligne, colonne, tab3};
    
    
    // Opération sur les matrices
    
    for(int i=0; i<ligne; i++) {
        for(int j=0; j<colonne; j++) {
            somme = 0;
            for(int k=0; k<matrice1.nbColonne; k++) {
                somme+=matrice1.tab[i][k]*matrice2.tab[k][j];
            }
            matriceProduit.tab[i][j] = somme;
        }
    }
    
    
    // Affichage de la matrice
    printf("\n\nMatrice produit:\n");
    for(int i=0; i<matriceProduit.nbLigne; i++) {
        for(int j=0; j<matriceProduit.nbColonne; j++) {
            printf("%d ", matriceProduit.tab[i][j]);
        }
        printf("\n");
    }
    
    
    // Libérer la mémoire
    free(tab1);
    free(tab2);
    free(tab3);
    
    exit(0);
}
