/*
 * Vérification de parenthèses.
 */

#include <stdio.h>

#include "pile.h"

int main() {
    pile_t p;
    char c;
    int nb_ligne, nb_colonne;
    nb_ligne = 1;
    nb_colonne = 1;
    
    init_pile(&p);
    
    scanf("%c", &c);
    while(c != '$') {
        if(c == '(' || c == '[' || c == '{') {
            empiler(&p, c);
        }
        else if(c == ')' || c == ']' || c == '}') {
            char ch = sommet(&p);
            if(pile_vide(&p) || !( ((c == ')') && (ch == '(')) || ((c == ']') && (ch == '[')) || ((c == '}') && (ch == '{')) )) {
                printf("error line %d col %d\n", nb_ligne, nb_colonne);
                printf("non\n");
                return 1;
            }
            depiler(&p);
        }
    
        scanf("%c", &c);
        if(c=='\n') {
            nb_ligne+=1;
            nb_colonne=1;
        } else {
            nb_colonne +=1;
        }
    }
    
    if(pile_vide(&p)) {
        printf("oui\n");
    } else {
        printf("non\n");
    }

    return 0;
}
