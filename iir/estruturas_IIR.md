# Estruturas de Filtros IIR

Um sistema LTI que satisfaz a equação de diferença da forma: 

![](eq1.png)

Possui uma resposta ao impulso correspondente:

![](eq2.png)

E pode ser implementado de diferentes formas, sendo frequentemente usadas a (1) forma Direta; a (2) forma em Cascata e (3) forma Paralela.

## Formas diretas

Um sistema LTI que satisfaz a equação de diferença da forma: 

![](eq1.png)

Possui uma resposta ao impulso correspondente:

![](eq1.png)

Pode ser implementado na forma direta I por inspeção através da estruta da Figura_1, que mostra o diagrama em fluxo de sinais. 

![](fig1.png)

Esta forma pode ser simplificada utilizando a representação em fluxo de sinais na forma direta II.

![](fig2.png)

## Formas em cascata

O mesmo sistema LTI pode ser fatorado como uma razão de um produto de polinomios, onde H(z) toma a forma:

![](eq3.png)

onde M = M1+2M2 e N = N1 +2N2. fk e ck são zeros reais e polos reais, e `gk, *gk, dk, *dk` são pares conjugados complexos de polos e zeros.

Pode ser escrito como um produtório de polinomios de segunda ordem:

![](eq4.png)

E portanto implementado na seguinte estrutura concatenada, por inspeção:

![](fig3.png)

## Formas em paralelo

Como alternativa para evitar a fatoração, o sistema pode ser implementado em paralelo expandindo a equação em frações parciais, conforme equação:

![](eq5.png)

Esse sistema possui a implementação na forma paralela com a seguinte estrutura:

![](fig4.png)