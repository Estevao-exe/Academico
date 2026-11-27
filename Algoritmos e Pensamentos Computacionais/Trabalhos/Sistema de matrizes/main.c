#include <stdio.h>
#include "matrizes.h"

int main() {

    Matriz matrizes[MAX_MATRIZES];
    Matriz resultado, temp, inversa;

    int quantidade;
    int opcao;
    int sucesso;
    int inversaFalhou;

    // CADASTRO DA QUANTIDADE DE MATRIZES
    do {

        printf("Quantas matrizes deseja utilizar? (2 a %d): ",
               MAX_MATRIZES);

        if (scanf("%d", &quantidade) != 1) erroEntrada();

        if (quantidade < 2 || quantidade > MAX_MATRIZES) {
            printf("Quantidade invalida! Digite novamente.\n");
        }

    } while (quantidade < 2 || quantidade > MAX_MATRIZES);

    // CADASTRO DAS MATRIZES
    for (int i = 0; i < quantidade; i++) {

        lerMatriz(&matrizes[i], i + 1);

    }

    // MENU DE OPERACOES
    printf("\n========== MENU ==========\n");
    printf("1 - Adicao\n");
    printf("2 - Subtracao\n");
    printf("3 - Multiplicacao\n");
    printf("4 - Divisao matricial\n");
    printf("Escolha uma operacao: ");

    if (scanf("%d", &opcao) != 1) erroEntrada();

    if (opcao < 1 || opcao > 4) {
        printf("\nOpcao invalida!\n");
        return 0;
    }

    // A PRIMEIRA MATRIZ SERA O RESULTADO INICIAL
    resultado = matrizes[0];

    sucesso = 1;
    inversaFalhou = 0;

    // OPERACOES SEQUENCIAIS
    for (int i = 1; i < quantidade; i++) {

        switch (opcao) {

            case 1:

                sucesso = somar(resultado, matrizes[i], &temp);

                break;

            case 2:

                sucesso = subtrair(resultado, matrizes[i], &temp);

                break;

            case 3:

                sucesso = multiplicar(resultado, matrizes[i], &temp);

                break;

            case 4:

                // Calcula a inversa da matriz divisora
                if (!inverter(matrizes[i], &inversa)) {

                    printf("\nErro: A matriz %d e singular "
                           "ou nao e quadrada.\n", i + 1);

                    sucesso = 0;
                    inversaFalhou = 1;
                    break;
                }

                // Multiplica o resultado pela inversa
                sucesso = multiplicar(resultado, inversa, &temp);

                break;
        }

        if (!sucesso) {

            if (opcao == 1) {
                printf("\nErro: As matrizes possuem dimensoes diferentes.\n");
            }
            else if (opcao == 2) {
                printf("\nErro: As matrizes possuem dimensoes diferentes.\n");
            }
            else if (opcao == 3) {
                printf("\nErro: Numero de colunas da primeira matriz "
                       "diferente do numero de linhas da segunda.\n");
            }
            else if (opcao == 4 && !inversaFalhou) {
                printf("\nErro: Dimensoes incompativeis para a divisao.\n");
            }

            break;
        }

        // Atualiza o resultado para a proxima operacao
        resultado = temp;
    }

    // EXIBICAO DO RESULTADO
    if (sucesso) {

        printf("\n========== RESULTADO ==========\n");

        mostrarMatriz(resultado);

    } else {

        printf("\nNao foi possivel realizar a operacao.\n");

    }

    return 0;
}