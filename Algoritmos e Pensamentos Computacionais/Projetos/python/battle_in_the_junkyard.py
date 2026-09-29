print("============================")
print("===== Batalha no Lixão =====")
print("============================")

nome = input("Digite o nome do seu personagem: ")

life = 70
life_bot = 60
pocoes = 2

print(f"\n{nome}, você está no lixão e encontrou um Lixo Bot!\n")

for rodada in range(1, 6):
    print(f"\n--- Rodada {rodada} ---")
    print(f"Vida do {nome}: {life}")
    print(f"Vida do Lixo Bot: {life_bot}")
    print(f"Poções restantes: {pocoes}")

    acao = input(
        "Escolha sua ação ([1] atacar, [2] usar poção, [3] fugir): "
    )

    if acao == "1":
        dano = 20
        life_bot -= dano

        print(f"\nVocê atacou o Lixo Bot e causou {dano} de dano!")

        if life_bot <= 0:
            print("\nYOU WIN!")
            print(f"{nome}, VOCÊ DERROTOU Lixo Bot!🏆")
            break

        dano_bot = 40
        life -= dano_bot

        print(
            f"O Lixo Bot atacou você e causou {dano_bot} de dano!"
        )


        if life <= 0:
            print("\nGAME OVER!")
            print(f"{nome},⚠️ Lixo Bot te MATOU ")
            break

    elif acao == "2":
        if pocoes > 0:
            life += 15
            pocoes -= 1

            print(
                f"\nVocê recuperou 15 pontos de vida!❤️"
            )
            print(f"Sua vida agora é {life}.")
            print(f"Poções restantes: {pocoes}.")
        else:
            print("\nVocê não tem mais poções!")

    elif acao == "3":
        print(f"\n{nome}, você fugiu da batalha!")
        print("GAME OVER!")
        break

    else:
        print("\n !! Ação inválida! Escolha 1, 2 ou 3.")
