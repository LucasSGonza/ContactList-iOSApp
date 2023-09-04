import UIKit

//Desafio consiste em criar um 'Jogo da Velha'

// Criar as linhas e colunas do jogo
var firstLine: (String,String,String) = ("","","")
var secondLine: (String,String,String) = ("","","")
var thirdLine: (String,String,String) = ("","","")
print("\(firstLine)\n\(secondLine)\n\(thirdLine)")

print("primeira linha = a\nsegunda linha = b\nterceira linha = c\n------\ncolunas = 1,2,3")

//Indicar os jogadores
let jogador1 = "o", jogador2 = "x"
print("Jogador 1 = o\nJogador 2 = x")
print("\nVamos começar!")

//variavel global (tipo flag)
var resultado = ""

//queria utilizar entradas do usuário utilizando o comando readLine() mas pelo oq eu pesquisei esse comando não funciona no playground


/* Montando o jogo de forma manual
 x  o   x
 x  o   o
 x  x   o
 */

firstLine.0.append(jogador2)
firstLine.1 = jogador1
firstLine.2 = jogador2

secondLine.0 = jogador2
secondLine.1.append(jogador1)
secondLine.2 = jogador1

thirdLine.0.append(jogador2)
thirdLine.1 = jogador2
thirdLine.2 = jogador1

print("\n\(firstLine)\n\(secondLine)\n\(thirdLine)")

//Verificar quem ganhou

// analisando se teve vitória na horizontal

//primeira linha
if !(firstLine.0.isEmpty) {
    if firstLine.1 == firstLine.0 {
        if firstLine.2 == firstLine.1 {
            resultado = firstLine.2 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}
//segunda linha
if !(secondLine.0.isEmpty) {
    if secondLine.1 == secondLine.0 {
        if secondLine.2 == secondLine.1 {
            resultado = secondLine.2 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}
//terceira linha
if !(thirdLine.0.isEmpty) {
    if thirdLine.1 == thirdLine.0 {
        if thirdLine.2 == thirdLine.1 {
            resultado = thirdLine.2 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}

//analisando se teve vitória na vertical

//coluna 0
if !(firstLine.0.isEmpty) {
    if secondLine.0 == firstLine.0 {
        if thirdLine.0 == secondLine.0 {
            resultado = thirdLine.0 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}
//coluna 1
if !(firstLine.1.isEmpty) {
    if secondLine.1 == firstLine.1 {
        if thirdLine.1 == secondLine.1 {
            resultado = thirdLine.1 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}
//coluna 2
if !(firstLine.2.isEmpty) {
    if secondLine.2 == firstLine.2 {
        if thirdLine.2 == secondLine.2 {
            resultado = thirdLine.2 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}

//analisando se teve vitória nas diagonais

//diagonal primária
if !(firstLine.0.isEmpty) {
    if secondLine.1 == firstLine.0 {
        if thirdLine.2 == secondLine.1 {
            resultado = thirdLine.2 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}
//diagonal secundária
if !(firstLine.2.isEmpty) {
    if secondLine.1 == firstLine.2 {
        if thirdLine.0 == secondLine.1 {
            resultado = thirdLine.0 == "x" ? "x ganhou" : "o ganhou"
        }
    }
}

if resultado == "x ganhou" || resultado == "o ganhou"{
    print(resultado)
} else {
    print("Empate")
}
