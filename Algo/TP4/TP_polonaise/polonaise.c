#include "polonaise.h"

int puissance(int a, int b) {
    int res=1;
    for(int i = 0; i < b; i++) {
        res *= a;
    }
    return res;
}

int factorielle(int nombre) {
    if(nombre == 0) {
        return 1;
    }
    return factorielle(nombre-1)*nombre;
}

bool isOperator(char c) {
    if(c == '+' || c == '-' || c == '*' || c == '/' || c == '\'' || c == ',' || c == '!') {
        return true;
    }
    return false;
}

bool isDigit(char c) {
    if(c >= '0' && c <= '9') {
        return true;
    }
    return false;
}

void doOperation(struct pile_t *p, char c, int * errorCode) {
    int firstValue = sommet(p);
    depiler(p);
    int secondValue;
    if (c == ',') {
        empiler(p, -firstValue);
    }
    else if (c == '!') {
        empiler(p, factorielle(firstValue));
    }
    else {
        if(pile_vide(p)) {
            *errorCode = -1;
        }
        else {
            secondValue = sommet(p);
            depiler(p);
            if(c == '\'') {
                empiler(p, puissance(secondValue, firstValue));
            } else if (c == '+') {
                empiler(p, secondValue + firstValue);
            } else if (c == '-') {
                empiler(p, secondValue - firstValue);
            } else if (c == '*') {
                empiler(p, secondValue * firstValue);
            } else if (c == '/') {
                empiler(p, secondValue / firstValue);
            }
        }
    }
}

/* Completer cette fonction */
int calc(){
    char c;
    scanf("%c",&c);
    
    pile_t p;
    init_pile(&p);
    
    while(c != '=') {
        if(c != ' ') {
            if (isOperator(c)) {
                if(pile_vide(&p)) {
                    return -1;
                }
                int errorCode = 0;
                doOperation(&p, c, &errorCode);
                if (errorCode != 0) {
                    return errorCode;
                }
            } else if (isDigit(c)){
                empiler(&p, c-'0');
            }
        }
        scanf("%c",&c);
    }
    int result = sommet(&p);
    depiler(&p);
    if(!pile_vide(&p)){
        return -2;
    }
    
    return result;
}

// SHUNTING YARD
int givePriority(e) {
    if (e == '(') {
        return 0;
    } else if (e == '+' || e == '-') {
        return 1;
    } else if (e == '*' || e == '/') {
        return 2;
    } else if (e == '\'') {
        return 3;
    } else if (e == ',' || e == '!') {
        return 4;
    } else {
        //debug
        return 100;
        printf("error give priority");
    }
}

bool lessPriority(operator, sommet) {
    int prioOperator = givePriority(operator);
    int prioSommet = givePriority(sommet);
    
    return prioOperator > prioSommet ? true : false;
}


void addCharToPile(char c, char *e, int *i) {
    e[*i] = c;
    e[*i+1] = ' ';
    *i+=2;
}

int shunting_yard(char* e){
    pile_t p;
    init_pile(&p);
    
    char c;
    scanf("%c",&c);
    
    int i=0;

    while (c != '=') {
        if (isDigit(c)) {
            addCharToPile(c, e, &i);
        } else if (c == '(') {
            empiler(&p, c);
        } else if (c == ')') {
            while (!pile_vide(&p) && sommet(&p) != '(') {
                addCharToPile(sommet(&p), e, &i);
                depiler(&p);
            }
            if (sommet(&p) == '(') {
                depiler(&p);
            }
        } else if (isOperator(c)) {
            while (!pile_vide(&p) && (isDigit(sommet(&p)) || !lessPriority(c, sommet(&p)))) {
                addCharToPile(sommet(&p), e, &i);
                depiler(&p);
            }
            empiler(&p, c);
        }
        scanf("%c",&c);
    }

    while(!pile_vide(&p)) {
        addCharToPile(sommet(&p), e, &i);
        depiler(&p);
    }
    
    e[i-1] = '\0';
    return 0;
}

int main(void) {
    char e[100];
    shunting_yard(e);
    return 0;
}
