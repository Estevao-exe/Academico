#include <stdio.h>
#include <stdlib.h>
#include "matrizes.h"

// Encerra o programa quando o scanf nao consegue ler nada
// (STDIN vazio, acabou a entrada ou foi digitado algo que nao e numero)
void erroEntrada(void) {
    printf("\nErro: entrada ausente ou invalida. Encerrando.\n");
    exit(1);
}

void lerMatriz(Matriz *m, int numero) {

    printf("\n========== MATRIZ %d ==========\n", numero);

    do {
        printf("Quantidade de linhas (1 a %d): ", MAX);
        if (scanf("%d", &m->linhas) != 1) erroEntrada();

        if (m->linhas < 1 || m->linhas > MAX) {
            printf("Quantidade invalida!\n");
        }

    } while (m->linhas < 1 || m->linhas > MAX);

    do {
        printf("Quantidade de colunas (1 a %d): ", MAX);
        if (scanf("%d", &m->colunas) != 1) erroEntrada();

        if (m->colunas < 1 || m->colunas > MAX) {
            printf("Quantidade invalida!\n");
        }

    } while (m->colunas < 1 || m->colunas > MAX);

    printf("\nDigite os elementos da matriz:\n");

    for (int i = 0; i < m->linhas; i++) {

        for (int j = 0; j < m->colunas; j++) {

            printf("Elemento [%d][%d]: ", i + 1, j + 1);
            if (scanf("%lf", &m->elementos[i][j]) != 1) erroEntrada();

        }
    }
}

void mostrarMatriz(Matriz m) {

    for (int i = 0; i < m.linhas; i++) {

        for (int j = 0; j < m.colunas; j++) {

            printf("%10.2lf ", m.elementos[i][j]);

        }

        printf("\n");
    }
}