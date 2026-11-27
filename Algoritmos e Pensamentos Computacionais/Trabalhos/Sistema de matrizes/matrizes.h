#ifndef MATRIZES_H
#define MATRIZES_H

#define MAX 20
#define MAX_MATRIZES 10

typedef struct {
    int linhas;
    int colunas;
    double elementos[MAX][MAX];
} Matriz;

// Funcoes de entrada e saida
void erroEntrada(void);
void lerMatriz(Matriz *m, int numero);
void mostrarMatriz(Matriz m);

// Operacoes matematicas
int somar(Matriz a, Matriz b, Matriz *resultado);
int subtrair(Matriz a, Matriz b, Matriz *resultado);
int multiplicar(Matriz a, Matriz b, Matriz *resultado);
int inverter(Matriz original, Matriz *inversa);

#endif