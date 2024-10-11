# BD: Guião 7


## ​7.2

### *a)*

```
A relação está na 1FN, pois todos os seus atributos são atómicos e não há grupos repetidos de colunas, ou seja não permite a existência de atributos compostos ou multivalores, e também está na 1FN porque não suporta relações dentro de relações, ou seja, não se pode usar uma relação como o valor de um atributo num tuplo.
```

### *b)*

```
2FN - todos os atributos não pertencentes a qualquer chave candidata devem depender totalmente da chave e não de parte dela, ou seja, não existem dependências parciais
R1: (_Titulo_Livro_, _Nome_Autor_, Tipo_Livro, Preco, NoPaginas, Editor, Endereco_Editor, Ano_Publicacao)
R2: (_Nome_Autor_, Afiliacao_Autor)

3FN - não existem dependências funcionais entre atributos não chave, ou seja, não existem dependências transitivas
R1 (_Titulo_Livro_, _Nome_Autor_, Tipo_Livro, NoPaginas, Editor, Ano_Publicacao)
R2 (_Nome_Autor_, Afiliacao_Autor)
R3 (_Tipo_Livro_, _NoPaginas_, Preco)
R4 (_Editor_, Endereco_Editor)
```


## ​7.3

### *a)*

```
Resposta: {A,B}

F={ {A, B}→{C}, {A}→{D, E}, {B}→{F}, {F}→{G, H}, {D}→{I, J}}

Ao analisarmos as dependências funcionais percebemos que a chave candidate a R será {A, B} pois A e B juntos geram todos os atributos:
A gera E e D, que por sua vez gera I e J.
B gera F, que gera G e H.
A e B juntos geram C.
```


### *b)*

```
R1 (_A_, _B_, C) - criada uma nova relação onde existe uma Dependencia total de C para com A e B
R2 (_B_, F, G, H) - criada uma nova relação onde existe uma Dependencia total de H,G,F para com B, pois B gera F, que por sua vez gera G e H
R3 (_A_, D, E, I, J) - criada uma nova relação onde existe uma Dependencia total de J,I,E,D para com A, pois A gera E e D, que por sua vez gera I e J
```


### *c)*

```
Para obter o 3FN separamos as relações de forma a que não existam dependências transitivas
R1 (_A_, _B_, C)
R2 (_B_, F)
R3 (_F_, G, H)
R4 (_A_, D, E)
R5 (_D_, I, J)
```


## ​7.4

### *a)*

```
Resposta: {A,B}

F={ {A, B}→{C,D,E}, {D}→{E}, {C}→{A}}.

Ao analisarmos as dependências funcionais percebemos que a chave candidate a R será {A, B} pois a partir de A e B todos os atributos podem ser determinados
```


### *b)*

```
Já começa em 2FN pois não tem dependencias parciais e por isso podemos começar por transformar já para 3FN ->
R1 (_A_, _B_, C, D) - removemos E que depende transitivamente de D.
R2 (_D_, E) - E depende de D.
R3 (_C_, A) - A depende de C
```


### *c)*

```
R1 (_B_, C, D)
R2 (_D_, E) - E depende de D
R3 (_C_, A) - A depende de C
```


## ​7.5

### *a)*

```
{A, B}

F={{A,B}→{C,D,E}, {A}→{C}, {C}→{D}}.

Ao analisarmos as dependências funcionais percebemos que a chave candidate a R será {A, B} pois a partir de A e B todos os atributos podem ser determinados
```

### *b)*

```
R1 (_A_, _B_, C, D, E) - A e B geram C,D,E
R2 (_A_, C, D) - criada uma nova relação onde existe uma Dependencia total de C,D para com A, pois A gera C que por sua vez gera o D
```


### *c)*

```
R3 (_A_, _B_, E)
R4 (_C_, D) - já está na 3FN, pois agora D é dependente apenas de C e não do A.
R5 (_A_, C) - isolamos A e C, uma vez que {A} -> {C} e {C} -> {D} foram separadas.
```

### *d)*

```
Na BCNF, todos os atributos são funcionalmente dependentes da chave da relação, de toda a chave e de nada mais, garantindo assim que não existem dependências funcionais em que um atributo não-chave é determinado por parte de uma chave.
Como isto já ocorre na alinea anterior, esta já tem de estar por isso na BCFN
```
