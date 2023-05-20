import Foundation

//Desafio consiste em criar um 'Jogo da Velha'

// Criar as linhas e colunas do jogo
var firstLine: [String] = []
var secondLine: [String] = []
var thirdLine: [String] = []

print("\(firstLine)\n\(secondLine)\n\(thirdLine)")

//Indicar os jogadores
let jogador1 = "o", jogador2 = "x"
print("\nJogador 1 = o\nJogador 2 = x")

//variavel global resultado, inicializando vazia
var result:String = ""

print("\nVamos começar!")

/* Montando o jogo de forma manual
 x  .   o
 .  x   .
 o  .   x
*/

firstLine.append(contentsOf: ["","",""] )
secondLine = ["","x",""]
thirdLine = ["o", "","x"]

print("\n\(firstLine)\n\(secondLine)\n\(thirdLine)")

//VERIFICAÇÕES

//verificar em cada Array/linha se existem 3 caracteres iguais
for linha in [firstLine, secondLine, thirdLine] {
  if linha.allSatisfy({ $0 == linha.first && $0 != "" }) {
    result = (linha.first == "x" ? "x ganhou" : "o ganhou")
    break
  }
}

//verifica em cada coluna se existem 3 caracteres iguais
for index in 0...2 {
  //print(index)
  let column = [firstLine[index], secondLine[index], thirdLine[index]]
  if column.allSatisfy({ $0 == column.first && $0 != "" }) {
    result = (column.first == "x" ? "x ganhou" : "o ganhou")
    break
  }
}

//verifica nas diagonais se existem 3 caracteres iguais
let diagonais = [[firstLine[0], secondLine[1], thirdLine[2]], [firstLine[2], secondLine[1], thirdLine[0]]]
for diagonal in diagonais {
  if diagonal.allSatisfy({ $0 == diagonal.first && $0 != "" }) {
    result = (diagonal.first == "x" ? "x ganhou" : "o ganhou")
    break
  }
}

if result == "" {
  result = "Empate!"
}

print(result)