/*
 * Somme d'entiers.
 */

#include <stdio.h>

#include "pile.h"

/**
 * Calcul de la somme de l'expression representée en
 * chaine de caractere, mode récursif.
 * @param p		Pointeur sur le caractère courant.
 * @param s		Nombre courant.
 * @return		Résultat de la somme.
 */
int somme_rec(char *p, int s) {
	if(*p == '\0')
		return s;
	else if(*p == '+')
		return s + somme_rec(p + 1, 0);
	else
		return somme_rec(p + 1, s * 10 + *p - '0');
}


/**
 * Calcul de la somme de l'expression representée en
 * chaine de caractere, mode itératif en utilisant une pile.
 * @param c		Pointeur sur le début de la chaîne de caractère.
 * @return		Résultat de la somme.
 */
int somme_iter(char *c) {
    int somme = 0;
    pile_t p;
    while(*c != '\0') {
        *c+=1;
        printf("%c", *c);
        /*
        if(*c == '+') {
            while(!pile_vide(&p)) {
                somme = somme*10 + sommet(&p);
                depiler(&p);
            }
        } else {
            empiler(&p, *c);
        }
         */
    }
	
	return somme;
}

int main() {
	char ch[256];
	
	printf("Entrez une somme :\n");
	scanf("%s", ch);
	
	printf("Resultat recursif : %d\n", somme_rec(ch, 0));
	printf("Resultat itératif : %d\n", somme_iter(ch));
	
	return 0;
}
