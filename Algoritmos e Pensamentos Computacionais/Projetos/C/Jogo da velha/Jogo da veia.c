#include <stdio.h>

int main(){
    char tabuleiro[3][3];
    int i, j;
    int linha, coluna;
    int jogadas = 0;

    // Inicializa o tabuleiro com '-'
    for(i=0; i<3; i++){
        for(j=0; j<3; j++){
            tabuleiro[i][j] = '-';
        }
    }

    while(1) {
        // --- VEZ DO JOGADOR X ---
        printf("\nVEZ DO JOGADOR 'X'\n");
        
        while(1) {
            printf("Digite a linha (0, 1 ou 2): ");
            scanf("%d", &linha);
            printf("Digite a coluna (0, 1 ou 2): ");
            scanf("%d", &coluna);
            
            if(tabuleiro[linha][coluna] == '-') {
                break; // Sai apenas deste while interno
            } else {
                printf("Essa casa ja esta ocupada! Tente outra.\n");
            }
        }
        
        tabuleiro[linha][coluna] = 'X';
        jogadas++;

        // Mostra o tabuleiro atualizado após a jogada do X
        printf("\n  Tabuleiro  \n");
        for(i=0; i<3; i++){
            for(j=0; j<3; j++){
                printf(" %c ", tabuleiro[i][j]); 
            }
            printf("\n");
        }

        // Verifica se o jogo acabou após a jogada do X
        if(jogadas == 9) {
            printf("\nO tabuleiro encheu! O jogo acabou.\n");
            break;
        }

        // --- VEZ DO JOGADOR O ---
        printf("\nVEZ DO JOGADOR 'O'\n");
        
        while(1) {
            printf("Digite a linha (0, 1 ou 2): ");
            scanf("%d", &linha);
            printf("Digite a coluna (0, 1 ou 2): ");
            scanf("%d", &coluna);
            
            if(tabuleiro[linha][coluna] == '-') {
                break; // Sai apenas deste while interno
            } else {
                printf("Essa casa ja esta ocupada! Tente outra.\n");
            }
        }

        tabuleiro[linha][coluna] = 'O';
        jogadas++;

        // Mostra o tabuleiro atualizado após a jogada do O
        printf("\n  Tabuleiro  \n");
        for(i=0; i<3; i++){
            for(j=0; j<3; j++){
                printf(" %c ", tabuleiro[i][j]); 
            }
            printf("\n"); 
        }

        // Verifica se o jogo acabou após a jogada do O
        if(jogadas == 9) {
            printf("\nO tabuleiro encheu! O jogo acabou.\n");
            break;
        }
        
    } // Fecha o while principal

    return 0;
}
