//import UIKit
import Foundation

//4 bimestres -> gera media_final (>=6)
//cada bimestre 3 provas -> gera media_bimestre

//Array que irá armazenar os valores das médias de cada bimestre
var bimestres: [Double] = []

//Array para armazenar temporariamente as notas de cada bimestre durante o loop for da linha 30
var notas: [Double] = [] //ao final de cada loop, a array é resetada, para ent armazenar novamente 3 notas

// função para otimizar o cálculo das médias -> possibilitando fazer de forma automática e genérica
/*
func calcMedia(_ num:Double, _ num2:Double, _ num3:Double) -> [Double] {
    bimestres.append( (num + num2 + num3) / 3 )
    return bimestres
}
*/
func calcMedia(_ num:Double, _ num2:Double, _ num3:Double) -> Double {
    let media = (num + num2 + num3) / 3
    return media
}

//loop para alocar as notas na Array de forma otimizada
for _ in 0...3 {  
  print("Digite as notas:")
  for _ in 0...2 {
    if let input = readLine(), let nota = Double(input) {  
      notas.append(nota)
    }
  }
  print(notas)
  bimestres.append( calcMedia(notas[0], notas[1], notas[2]) )
  print(bimestres)
  notas.removeAll() //reseta a Array para receber novas notas
}

print(bimestres)

bimestres.forEach { media_final in 
  (media_final >= 6) ? print("Aprovado!") : print("Reprovado!")
}