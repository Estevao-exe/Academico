import math
while True:
    print("----------------------")
    print("Calculadora Científica")
    print("----------------------")
    print("[1].Adição")
    print("[2].Subtração")
    print("[3].Multiplicação")
    print("[4].Divisão")
    print("[5].Raiz Quadrada")  
    print("[6].Potência")  
    print("[7].Logaritmo")  
    print("[8].Logaritmo base 10")  
    print("[9].Fatorial")  
    print("[10].Arredondamento para cima")  
    print("[11].Arredondamento para baixo")  
    print("[12].Seno")  
    print("[13].Cosseno")  
    print("[14].Tangente")  
    print("[15].Coverter graus") 
    print("[16].Converter para radianos") 
    print("[17].Exponencial") 
    print("[18].Valor absoluto") 
    print("[19].Separar parte inteira e decimal") 
    print("[20].Converter para binário") 
    print("[0].Sair")
    print("----------------------")

    escolha = int(input("Escolha uma operação: "))

    if escolha ==0:
        print("Até mais BaBy...!")
        break

    elif escolha == 1:
        n1 = float(input("Digite o primeiro número: "))
        n2 = float(input("Digite o segundo número: "))
        r = n1 + n2
        print(f"O resultado de {n1} e {n2} é: {r}")
    elif escolha ==2:
        n1 = float(input("Digite o primeiro número: "))
        n2 = float(input("Digite o segundo número: "))
        r = n1 - n2
        print(f"O resultado da subtração de {n1} e {n2} é: {r}")
    elif escolha == 3:
        n1 = float(input("Digite o primeiro número: ")) 
        n2 = float(input("Digite o segundo número: "))
        r = n1 * n2
        print(f"O resultado da multiplicação de {n1} e {n2} é: {r}")
    elif escolha == 4:
        n1 = float(input("Digite o primeiro número: "))
        n2 = float(input("Digite o segundo número: "))
        if n2 == 0:
            print("Não é possível dividir por zero!")
        else:
            r = n1 / n2
            print(f"O resultado da divisão de {n1} e {n2} é: {r}")

    elif escolha == 5:
        n1 = float(input("Digite o número: "))
        if n1<0:
            print("Numero negativo não tem raiz animal!")
        r = math.sqrt(n1)
        print(f"O resultado da raiz quadrada de {n1} é: {r}")

    elif escolha == 6:
        n1 = float(input("Digite a base: "))
        n2 = float(input("Digite o expoente: "))
        print("O resultado é: ", math.pow(n1, n2))

    elif escolha == 7:
        n1 = float(input("Digite o número: "))
        if n1 <= 0:
            print("O logaritmo não é feito com n° menor que zero besta!.")
        else:
            r = math.log(n1)
            print(f"O resultado do logaritmo natural de {n1} é: {r}")

    elif escolha == 8:
        n1 = float(input("Digite o número: "))
        if n1 < 0:
            print("O logaritmo não é feito com n° menor que zero besta!.")
        else:
            print("O resultado do logaritmo base 10 de", n1, "é:", math.log10(n1))

    elif escolha == 9:
        n1 = int(input("Diigite un numero papa: "))
        if n1 < 0:
            print("O fatorial não é definido para números negativos Mula!.")
        else:
            print("O fatorial de", n1, "é:", math.factorial(n1))

    elif escolha == 10:
        n1 = float(input("Digite um valor: "))
        print("O arredondamento para cima de", n1, "é:", math.ceil(n1))

    elif escolha == 11:
        n1 = float(input("Digite um valor: "))
        print("O arredondamento para baixo de", n1, "é:", math.floor(n1))

    elif escolha == 12:
        n1 = float(input("Digite um ângulo em graus:"))
        print(f"O seno de {n1} graus é: {math.sin(math.radians(n1))}")

    elif escolha == 13:
        n1 = float(input("Digite um ângulo em radianos: "))
        print(f"O cosseno de {n1} graus é: {math.cos(math.radians(n1))}")

    elif escolha == 14:
        n1 = float(input("Digite um ângulo em graus: "))
        print(f"A tangente de {n1} graus é: {math.tan(math.radians(n1))}")

    elif escolha == 15:
        n1 = float(input("Digite um ângulo em graus: "))
        print(f"{n1} graus é igual a {math.radians(n1)} radianos.")

    elif escolha == 16:
        n1 = float(input("Digite um ângulo em radianos: "))
        print(f"{n1} radianos é igual a {math.degrees(n1)} graus.")

    elif escolha == 17:
        n1 = float(input("Digite um numero: "))
        print(f"O exponencial de {n1} é: {math.exp(n1)}")

    elif escolha == 18:
        n1 = float(input("Digite um numero: "))
        print(f"O valor absoluto de {n1} é: {math.fabs(n1)}")

    elif escolha == 19:
        n1 = float(input("Digite um numero: "))
        print(f"A parte inteira de {n1} é: {math.floor(n1)}")

    elif escolha == 20:
        n1 = int(input("Digite um numero inteiro: "))
        print(f"O número {n1} em binário é: {bin(n1)[2:]}")