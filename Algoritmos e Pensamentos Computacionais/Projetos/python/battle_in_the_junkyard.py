print("=====Batalha no Lixão=====")
nome = input("Digite o nome do seu personagem: ")
life = 70
life_bot= 51
pocoes = 1

print(f"\n{nome}, você está no lixão e encontrou um Lixo Bot!\n")

for rodada in range(1, 6):
    print(f"\n--- Rodada {rodada}---")
    print(f"Vida do {nome}: {life}")
    print(f"Vida do Lixo Bot: {life_bot}")
    acao = input("Escolha sua ação ([1] atacar, [2] usar poção, [3] fugir): ").lower()
    print("=====Batalha no Lixão=====")
nome = input("Digite o nome do seu personagem: ")
life = 70
life_bot= 51
pocoes = 1

print(f"\n{nome}, você está no lixão e encontrou um Lixo Bot!\n")

for rodada in range(1, 6):
    print(f"\n--- Rodada {rodada}---")
    print(f"Vida do {nome}: {life}")
    print(f"Vida do Lixo Bot: {life_bot}")
    acao = input("Escolha sua ação ([1] atacar, [2] usar poção, [3] fugir): ").lower()
    if life_bot <= 0:
                print("Parabéns! Você derrotou o Lixo Bot!")
                break
    
    if acao == "1":
        dano = 25
        life_bot -= dano
        print(f"\nVocê atacou o Lixo Bot e causou {dano} de dano!")
        if life_bot > 0:
            life -= 15
            print(f"O Lixo Bot atacou você. Sua vida agora é {life}.")

    elif acao == "2" and pocoes > 0:
        life += 15
        pocoes -= 1
        print(f"\nVocê recuperou 15 pontos de vida. Sua vida agora é {life}. Poções restantes: {pocoes}.")
    else:
        print("\nVocê não tem poções restantes ou escolheu uma ação inválida.")



if life_bot <= 0:
    print(f"\nYOU WIN! {nome}! Você derrotou o Lixo Bot!")
else:
    print(f"\nGAME OVER! {nome}! Você foi derrotado pelo Lixo Bot!") 
    
    if acao == "1":
        dano = 25
        life_bot -= dano
        print(f"\nVocê atacou o Lixo Bot e causou {dano} de dano!")
        if life_bot > 0:
            life -= 15
            print(f"O Lixo Bot atacou você. Sua vida agora é {life}.")

    elif acao == "2" and pocoes > 0:
        life += 15
        pocoes -= 1
        print(f"\nVocê recuperou 15 pontos de vida. Sua vida agora é {life}. Poções restantes: {pocoes}.")
    else:
        print("\nVocê não tem poções restantes ou escolheu uma ação inválida.")



if life_bot <= 0:
    print(f"\nYOU WIN! {nome}! Você derrotou o Lixo Bot!")
else:
    print(f"\nGAME OVER! {nome}! Você foi derrotado pelo Lixo Bot!") 
