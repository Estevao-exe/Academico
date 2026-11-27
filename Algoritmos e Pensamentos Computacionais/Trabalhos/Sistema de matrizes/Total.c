#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define MAX 20
#define MAX_MATRIZES 10

typedef struct {
    int linhas;
    int colunas;
    double elementos[MAX][MAX];
} Matriz;

static void erroEntrada(void) {
    printf("\nErro: entrada ausente ou invalida. Encerrando.\n");
    exit(1);
}

static void lerMatriz(Matriz *m, int numero) {
    printf("\n========== MATRIZ %d ==========\n", numero);

    do {
        printf("Quantidade de linhas (1 a %d): ", MAX);
        if (scanf("%d", &m->linhas) != 1) erroEntrada();
        if (m->linhas < 1 || m->linhas > MAX)
            printf("Quantidade invalida!\n");
    } while (m->linhas < 1 || m->linhas > MAX);

    do {
        printf("Quantidade de colunas (1 a %d): ", MAX);
        if (scanf("%d", &m->colunas) != 1) erroEntrada();
        if (m->colunas < 1 || m->colunas > MAX)
            printf("Quantidade invalida!\n");
    } while (m->colunas < 1 || m->colunas > MAX);

    printf("\nDigite os elementos da matriz:\n");
    for (int i = 0; i < m->linhas; i++) {
        for (int j = 0; j < m->colunas; j++) {
            printf("Elemento [%d][%d]: ", i + 1, j + 1);
            if (scanf("%lf", &m->elementos[i][j]) != 1) erroEntrada();
        }
    }
}

static void mostrarMatriz(Matriz m) {
    for (int i = 0; i < m.linhas; i++) {
        for (int j = 0; j < m.colunas; j++)
            printf("%10.2lf ", m.elementos[i][j]);
        printf("\n");
    }
}

static int somar(Matriz a, Matriz b, Matriz *resultado) {
    if (a.linhas != b.linhas || a.colunas != b.colunas) return 0;

    resultado->linhas = a.linhas;
    resultado->colunas = a.colunas;
    for (int i = 0; i < a.linhas; i++)
        for (int j = 0; j < a.colunas; j++)
            resultado->elementos[i][j] = a.elementos[i][j] + b.elementos[i][j];
    return 1;
}

static int subtrair(Matriz a, Matriz b, Matriz *resultado) {
    if (a.linhas != b.linhas || a.colunas != b.colunas) return 0;

    resultado->linhas = a.linhas;
    resultado->colunas = a.colunas;
    for (int i = 0; i < a.linhas; i++)
        for (int j = 0; j < a.colunas; j++)
            resultado->elementos[i][j] = a.elementos[i][j] - b.elementos[i][j];
    return 1;
}

static int multiplicar(Matriz a, Matriz b, Matriz *resultado) {
    if (a.colunas != b.linhas) return 0;

    resultado->linhas = a.linhas;
    resultado->colunas = b.colunas;
    for (int i = 0; i < resultado->linhas; i++) {
        for (int j = 0; j < resultado->colunas; j++) {
            resultado->elementos[i][j] = 0.0;
            for (int k = 0; k < a.colunas; k++)
                resultado->elementos[i][j] += a.elementos[i][k] * b.elementos[k][j];
        }
    }
    return 1;
}

static int inverter(Matriz original, Matriz *inversa) {
    if (original.linhas != original.colunas) return 0;

    int n = original.linhas;
    double aug[MAX][2 * MAX];

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++)
            aug[i][j] = original.elementos[i][j];
        for (int j = 0; j < n; j++)
            aug[i][j + n] = (i == j) ? 1.0 : 0.0;
    }

    for (int i = 0; i < n; i++) {
        int pivo = i;
        for (int k = i + 1; k < n; k++)
            if (fabs(aug[k][i]) > fabs(aug[pivo][i])) pivo = k;

        if (fabs(aug[pivo][i]) < 1e-10) return 0;

        if (pivo != i) {
            for (int j = 0; j < 2 * n; j++) {
                double temp = aug[i][j];
                aug[i][j] = aug[pivo][j];
                aug[pivo][j] = temp;
            }
        }

        double divisor = aug[i][i];
        for (int j = 0; j < 2 * n; j++) aug[i][j] /= divisor;

        for (int k = 0; k < n; k++) {
            if (k == i) continue;
            double fator = aug[k][i];
            for (int j = 0; j < 2 * n; j++)
                aug[k][j] -= fator * aug[i][j];
        }
    }

    inversa->linhas = n;
    inversa->colunas = n;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < n; j++)
            inversa->elementos[i][j] = aug[i][j + n];
    return 1;
}

int main(void) {
    Matriz matrizes[MAX_MATRIZES];
    Matriz resultado, temp, inversa;
    int quantidade, opcao;

    do {
        printf("Quantas matrizes deseja utilizar? (2 a %d): ", MAX_MATRIZES);
        if (scanf("%d", &quantidade) != 1) erroEntrada();
        if (quantidade < 2 || quantidade > MAX_MATRIZES)
            printf("Quantidade invalida! Digite novamente.\n");
    } while (quantidade < 2 || quantidade > MAX_MATRIZES);

    for (int i = 0; i < quantidade; i++) lerMatriz(&matrizes[i], i + 1);

    printf("\n========== MENU ==========\n");
    printf("1 - Adicao\n2 - Subtracao\n3 - Multiplicacao\n4 - Divisao matricial\n");
    printf("Escolha uma operacao: ");
    if (scanf("%d", &opcao) != 1) erroEntrada();
    if (opcao < 1 || opcao > 4) {
        printf("\nOpcao invalida!\n");
        return 0;
    }

    resultado = matrizes[0];
    int sucesso = 1;

    for (int i = 1; i < quantidade; i++) {
        if (opcao == 1) {
            sucesso = somar(resultado, matrizes[i], &temp);
        } else if (opcao == 2) {
            sucesso = subtrair(resultado, matrizes[i], &temp);
        } else if (opcao == 3) {
            sucesso = multiplicar(resultado, matrizes[i], &temp);
        } else {
            if (!inverter(matrizes[i], &inversa)) {
                printf("\nErro: A matriz %d e singular ou nao e quadrada.\n", i + 1);
                sucesso = 0;
                break;
            }
            sucesso = multiplicar(resultado, inversa, &temp);
        }

        if (!sucesso) {
            if (opcao == 1 || opcao == 2)
                printf("\nErro: As matrizes possuem dimensoes diferentes.\n");
            else if (opcao == 3)
                printf("\nErro: Numero de colunas da primeira matriz diferente do numero de linhas da segunda.\n");
            else
                printf("\nErro: Dimensoes incompativeis para a divisao.\n");
            break;
        }
        resultado = temp;
    }

    if (sucesso) {
        printf("\n========== RESULTADO ==========\n");
        mostrarMatriz(resultado);
    } else {
        printf("\nNao foi possivel realizar a operacao.\n");
    }

    return 0;
}
