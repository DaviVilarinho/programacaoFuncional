# Trabalho Final de Programação Funcional

**Davi Felipe Ramos de Oliveira Vilarinho**

12011BCC006

## Estrutura do arquivo

Organizei o trabalhando de tal forma que cada seção contém a análise do desempenho separado de cada variação 
e, ao final de todo o trabalho, uma comparação entre todos.

### Bolha

#### Original

O tempo para executar todos os testes foi de: 68.69 s

| Teste | Tempo (s) | Contador  |
|:-----:|:----------|:---------:|
|   l1  | 4.27      |     0     |
|   l2  | 4.71      | 1999000   |
|   l3  | 3.75      | 2000      |
|   l4  | 4.78      | 1990000   |
|   l5  | 17.77     | 4000000   |
|   l6  | 17.72     | 4000000   |
|   l7  | 17.93     | 5999000   |
|   x1  | 0.01      | 0         |
|   x2  | 0.01      | 190       |
|   x3  | 0.01      | 100       |
|   x4  | 0.00      | 90        |
|   x5  | 0.01      | 95        |
|   x6  | 0.01      | 66        |
|   x7  | 0.01      | 94        |

Nota-se que o algoritmo cresce exponencialmente 

#### Variação 1

O tempo para executar todos os testes foi de: 55.37 s

| Teste | Tempo (s) | Contador  |
|:-----:|:----------|:---------:|
|   l1  | 0.04      |     0     |
|   l2  | 4.76      | 1999000   |
|   l3  | 3.93      | 2000      |
|   l4  | 4.50      | 1990000   |
|   l5  | 18.01     | 4000000   |
|   l6  | 9.59      | 4000000   |
|   l7  | 18.82     | 5999000   |
|   x1  | 0.00      | 0         |
|   x2  | 0.00      | 190       |
|   x3  | 0.00      | 100       |
|   x4  | 0.00      | 90        |
|   x5  | 0.00      | 95        |
|   x6  | 0.01      | 66        |
|   x7  | 0.00      | 94        |

Não houve diminuição nas trocas (como era esperado), mas houve uma diminuição no tempo de avaliação de elementos repetidos.

#### Variação 2

O tempo para executar todos os testes foi de: 36.43 s

| Teste | Tempo (s) | Contador  |
|:-----:|:----------|:---------:|
|   l1  | 0.04      |     0     |
|   l2  | 2.82      | 1999000   |
|   l3  | 2.24      | 2000      |
|   l4  | 2.67      | 1990000   |
|   l5  | 10.34     | 4000000   |
|   l6  | 8.52      | 4000000   |
|   l7  | 11.52     | 5999000   |
|   x1  | 0.00      | 0         |
|   x2  | 0.00      | 190       |
|   x3  | 0.00      | 100       |
|   x4  | 0.00      | 90        |
|   x5  | 0.00      | 95        |
|   x6  | 0.00      | 66        |
|   x7  | 0.00      | 94        |

Houve uma diminuição bem relevante no tempo, uma vez que ele não precisa mais percorrer toda a lista, e sim a lista ainda não ordenada, 
aproveitando do fato de que o maior elemento da lista, em cada iteração, já está no final.

### Seleção

#### Original

| Teste | Tempo (s) | Contador  |
|:-----:|:----------|:---------:|
|   l1  | 0.82      |     0     |
|   l2  | > 11min   | indefinido |
|   l3  | > 11min   | indefinido |
|   l4  | > 11min   | indefinido |
|   l5  | > 11min   | indefinido |
|   l6  | > 11min   | indefinido |
|   l7  | > 11min   | indefinido |
|   x1  | 0.01      | 0         |
|   x2  | 0.37      | 19        |
|   x3  | 0.03      | 10        |
|   x4  | 0.19      | 18        |
|   x5  | 0.19      | 10        |
|   x6  | 0.07      | 13        |
|   x7  | 0.14      | 19        |

O tempo é grande demais por causa de sua para os piores cenários possíveis,
sendo usável, então, apenas com pequenas listas ou já ordenadas.

#### Variação 1

Os testes todos rodaram em: 17.10s

| Teste | Tempo (s) | Contador  |
|:-----:|:----------|:---------:|
|   l1  | 1.02      |     0     |
|   l2  | 1.39      | 1999      |
|   l3  | 1.06      | 1         |
|   l4  | 1.34      | 1999      |
|   l5  | 5.04      | 2000      |
|   l6  | 4.74      | 3999      |
|   l7  | 4.95      | 3999      |
|   x1  | 0.01      | 0         |
|   x2  | 0.01      | 19        |
|   x3  | 0.01      | 10        |
|   x4  | 0.01      | 18        |
|   x5  | 0.00      | 10        |
|   x6  | 0.00      | 13        |
|   x7  | 0.01      | 19        |

O tempo reduziu drasticamente, graças a diminuição da quantidade de vezes que uma lista era circulada.

#### Variação 2

### Inserção

#### Original 

O tempo para testar todos foi de: 22.34 s

| Teste | Tempo (s) | Contador  |
|:-----:|:----------|:---------:|
|   l1  | 0.04      |     0     |
|   l2  | 2.66      | 1999000   |
|   l3  | 0.03      | 2000      |
|   l4  | 2.58      | 1999000   |
|   l5  | 4.92      | 4000000   |
|   l6  | 4.93      | 4000000   |
|   l7  | 7.16      | 5999000   |
|   x1  | 0.00      | 0         |
|   x2  | 0.01      | 190       |
|   x3  | 0.01      | 100       |
|   x4  | 0.00      | 90        |
|   x5  | 0.01      | 95        |
|   x6  | 0.00      | 66        |
|   x7  | 0.01      | 94        |

O algoritmo evita perder tempo quando a lista já está quase ordenada, mas faz muitas comparações, embora mais eficientes que o Bubble Sort, por exemplo.

