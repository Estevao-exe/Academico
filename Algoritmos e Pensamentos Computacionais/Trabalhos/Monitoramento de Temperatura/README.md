# 🌡️ Desafio — Monitoramento de Temperatura

## 1. Identificação

**Aluno:** Estevão Figueiredo Garcia
**Disciplina:** Algoritmos e Pensamentos Computacionais
**Professora:** Karla Sartin
**Título do projeto:** Monitoramento de Temperatura

---

## 2. Objetivo

O objetivo do programa é realizar o monitoramento de temperaturas informadas pelo usuário.

O usuário define um limite de temperatura e, depois, informa várias temperaturas. O programa verifica quais temperaturas estao acima do limite e acompanha quando ocorrem três temperaturas consecutivas acima do limite.

Quando três temperaturas consecutivas acima do limite são identificadas, o monitoramento é encerrado automaticamente e um relatório final é apresentado.

---

## 3. Funcionamento do programa

### Definição do limite

Primeiramente, o programa solicita ao usuário que informe o limite de temperatura que será utilizado durante o monitoramento.

```c
printf("Digite o limite da temperatura: ");
scanf("%f", &limite);
```

O valor é armazenado na variável `limite`.

### Leitura das temperaturas

Depois de definir o limite, o programa entra em um laço `while` e começa a solicitar as temperaturas.

```c
while (consecutivas < 3) {
    printf("Digite a temperatura: ");
    scanf("%f", &temp);
}
```

Cada temperatura informada é armazenada na variável `temp`.

### Valores inválidos

O programa deve considerar entradas que não sejam números como inválidas.

Essas entradas não devem ser utilizadas nos cálculos do relatório.

### Temperaturas acima do limite

A cada temperatura informada, o programa verifica se ela é maior que o limite:

```c
if (temp > limite) {
    acima_limite++;
    consecutivas++;
}
```

Quando a temperatura está acima do limite, a quantidade de temperaturas acima do limite é aumentada e o contador de temperaturas consecutivas também é aumentado.

### Temperaturas consecutivas

A variável `consecutivas` é utilizada para controlar quantas temperaturas acima do limite foram informadas em sequência.

Quando uma temperatura não está acima do limite, o contador é zerado:

```c
else {
    consecutivas = 0;
}
```

Por exemplo:

```text
Temperatura: 35 → acima do limite → 1 consecutiva
Temperatura: 40 → acima do limite → 2 consecutivas
Temperatura: 25 → abaixo do limite → contador volta para 0
```

Dessa forma, temperaturas acima do limite só são consideradas consecutivas quando aparecem sem uma temperatura abaixo ou igual ao limite entre elas.

### Condição de encerramento

O monitoramento continua enquanto:

```c
while (consecutivas < 3)
```

Quando o contador chega a `3`, a condição deixa de ser verdadeira e o `while` é encerrado.

Assim, o programa encerra automaticamente após identificar três temperaturas consecutivas acima do limite.

---

## 4. Estruturas de repetição utilizadas

Foi utilizada a estrutura:

```c
while
```

O `while` foi utilizado para manter o monitoramento acontecendo enquanto ainda não foram registradas três temperaturas consecutivas acima do limite.

A condição utilizada foi:

```c
while (consecutivas < 3)
```

Enquanto o valor de `consecutivas` for menor que 3, o programa continua solicitando novas temperaturas.

Quando o contador chega a 3, o laço é encerrado.

---

## 5. Como executar

Para compilar o programa utilizando o GCC, abra o terminal na pasta onde está o arquivo `monitoramento.c` e execute:

```bash
gcc monitoramento.c -o monitoramento
```

Depois, execute o programa:

```bash
./monitoramento
```

No Windows, caso necessário, o executável poderá ser executado como:

```bash
monitoramento.exe
```

---

## 6. Testes realizados

### Teste 1 — Validação de entradas inválidas

**Objetivo:** verificar o comportamento do programa quando uma entrada inválida é informada.

**Entrada utilizada:**

```text
Limite: 30
Temperatura: 25
Temperatura: 35
Temperatura: 40
Temperatura: 45
```

**Resultado esperado:**

O programa deve aceitar os valores numéricos e continuar o monitoramento até atingir três temperaturas consecutivas acima do limite.

**Evidência:**

A captura de tela do teste está disponível em:

```text
<img width="417" height="301" alt="registro1" src="https://github.com/user-attachments/assets/af62d790-5de6-402b-a5e5-70f018883e24" />

```

---

### Teste 2 — Temperaturas acima do limite, porém não consecutivas

**Objetivo:** verificar se o contador de temperaturas consecutivas é zerado quando uma temperatura não está acima do limite.

**Exemplo utilizado:**

```text
Limite: 30

35 → acima
40 → acima
20 → abaixo
35 → acima
40 → acima
25 → abaixo
```

**Resultado esperado:**

O contador deve ser zerado sempre que uma temperatura estiver abaixo ou igual ao limite.

**Evidência:**

A captura de tela do teste está disponível :

```text
<img width="339" height="174" alt="Capturar" src="https://github.com/user-attachments/assets/4567cb8f-a296-4399-a261-544ab87abc04" />

```

---

### Teste 3 — Três temperaturas consecutivas acima do limite

**Objetivo:** verificar se o programa encerra o monitoramento após três temperaturas consecutivas acima do limite.

**Exemplo utilizado:**

```text
Limite: 30

25 → abaixo
35 → acima
40 → acima
45 → acima
```

**Resultado esperado:**

Ao receber `35`, `40` e `45`, o contador chega a 3 e o monitoramento é encerrado automaticamente.

**Evidência:**

A captura de tela do teste está disponível em:

```text
<img width="401" height="326" alt="registra2" src="https://github.com/user-attachments/assets/af351bec-9a9a-421a-b22d-0bca7ce2e082" />


```

---

## 7. Relatório final

Ao finalizar o monitoramento, o programa apresenta informações sobre as temperaturas registradas, incluindo:

* quantidade de temperaturas;
* maior temperatura;
* menor temperatura;
* média das temperaturas;
* quantidade de temperaturas acima do limite;

Essas informações permitem analisar os dados coletados durante o monitoramento.



## 8. Reflexão final

### Por que escolhi `while`?

Escolhi utilizar o `while` porque o programa precisa continuar recebendo temperaturas enquanto não forem identificadas três temperaturas consecutivas acima do limite, ficar rodando o código ate a função acabar.

A condição de repetição depende do valor da variável `consecutivas`:

```c
while (consecutivas < 3)
```

A diferença entre testar a condição antes ou depois da execução é importante porque o `while` verifica a condição antes de iniciar cada repetição. Dessa forma, quando o contador chega a 3, o programa não solicita uma nova temperatura e encerra o monitoramento.

Neste problema, o `while` foi adequado porque não sabemos exatamente quantas temperaturas serão informadas. O programa continua executando até que a condição de encerramento seja atingida.

