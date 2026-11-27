#include <stdio.h>
#include <math.h>
#include "matrizes.h"

// ADICAO
int somar(Matriz a, Matriz b, Matriz *resultado) {

    if (a.linhas != b.linhas ||
        a.colunas != b.colunas) {

        return 0;
    }

    resultado->linhas = a.linhas;
    resultado->colunas = a.colunas;

    for (int i = 0; i < a.linhas; i++) {

        for (int j = 0; j < a.colunas; j++) {

            resultado->elementos[i][j] =
                a.elementos[i][j] + b.elementos[i][j];

        }
    }

    return 1;
}

// SUBTRACAO
int subtrair(Matriz a, Matriz b, Matriz *resultado) {

    if (a.linhas != b.linhas ||
        a.colunas != b.colunas) {

        return 0;
    }

    resultado->linhas = a.linhas;
    resultado->colunas = a.colunas;

    for (int i = 0; i < a.linhas; i++) {

        for (int j = 0; j < a.colunas; j++) {

            resultado->elementos[i][j] =
                a.elementos[i][j] - b.elementos[i][j];

        }
    }

    return 1;
}

// MULTIPLICACAO
int multiplicar(Matriz a, Matriz b, Matriz *resultado) {

    if (a.colunas != b.linhas) {
        return 0;
    }

    resultado->linhas = a.linhas;
    resultado->colunas = b.colunas;

    for (int i = 0; i < resultado->linhas; i++) {

        for (int j = 0; j < resultado->colunas; j++) {

            resultado->elementos[i][j] = 0;

            for (int k = 0; k < a.colunas; k++) {

                resultado->elementos[i][j] +=
                    a.elementos[i][k] * b.elementos[k][j];

            }
        }
    }

    return 1;
}

// INVERSAO DE MATRIZ
int inverter(Matriz original, Matriz *inversa) {

    if (original.linhas != original.colunas) {
        return 0;
    }

    int n = original.linhas;

    double aug[MAX][2 * MAX];

    // Montando a matriz aumentada [A | I]
    for (int i = 0; i < n; i++) {

        for (int j = 0; j < n; j++) {
            aug[i][j] = original.elementos[i][j];
        }

        for (int j = 0; j < n; j++) {
            aug[i][j + n] = (i == j) ? 1.0 : 0.0;
        }
    }

    // Metodo de Gauss-Jordan
    for (int i = 0; i < n; i++) {

        // Procurando o maior pivo
        int pivo = i;

        for (int k = i + 1; k < n; k++) {

            if (fabs(aug[k][i]) > fabs(aug[pivo][i])) {
                pivo = k;
            }
        }

        // Verificando se a matriz e singular
        if (fabs(aug[pivo][i]) < 1e-10) {
            return 0;
        }

        // Troca de linhas
        if (pivo != i) {

            for (int j = 0; j < 2 * n; j++) {

                double temp = aug[i][j];

                aug[i][j] = aug[pivo][j];

                aug[pivo][j] = temp;
            }
        }

        // Tornando o pivo igual a 1
        double divisor = aug[i][i];

        for (int j = 0; j < 2 * n; j++) {
            aug[i][j] /= divisor;
        }

        // Zerando os outros elementos da coluna
        for (int k = 0; k < n; k++) {

            if (k != i) {

                double fator = aug[k][i];

                for (int j = 0; j < 2 * n; j++) {

                    aug[k][j] -= fator * aug[i][j];

                }
            }
        }
    }

    // Extraindo a matriz inversa
    inversa->linhas = n;
    inversa->colunas = n;

    for (int i = 0; i < n; i++) {

        for (int j = 0; j < n; j++) {

            inversa->elementos[i][j] = aug[i][j + n];

        }
    }

    return 1;
}