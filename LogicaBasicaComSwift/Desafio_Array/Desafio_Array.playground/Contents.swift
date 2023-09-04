import UIKit

//4 bimestres -> gera media_final (>=6)
//cada bimestre 3 provas -> gera media_bimestre

//var bimestres = [1bi,2bi,3bi,4bi] -> cada valor deve ser a média do bimestre, ou seja, eu armazeno somente o valor da media

// Array's das notas de cada semestre
var firstbi_tests: [Double] = [7,6,5];
var secondbi_tests: [Double] = [7,7,7];
var thirdbi_tests: [Double] = [10,5,6];
var fourthbi_tests: [Double] = [7,8,9];

//Array que irá armazenar os valores das médias de cada bimestre
var bimestres: [Double] = [];


func calcMedia(_ num:Double, _ num2:Double, _ num3:Double) -> [Double] {
    bimestres.append( (num + num2 + num3) / 3 )
    return bimestres
}

/*
//1ºBimestre
var firstbi_result: Double = ((firstbi_tests[0] + firstbi_tests[1] + firstbi_tests[2]) / (Double(firstbi_tests.count)));
print("Media 1 Bimestre: \(firstbi_result)")

//2ºBimestre
var secondbi_result: Double = ((secondbi_tests[0] + secondbi_tests[1] + secondbi_tests[2]) / (Double(secondbi_tests.count)));
print("Media 2 Bimestre: \(secondbi_result)")

//3ºBimestre
var thirdbi_result: Double = ((thirdbi_tests[0] + thirdbi_tests[1] + thirdbi_tests[2]) / (Double(thirdbi_tests.count)));
print("Media 3 Bimestre: \(thirdbi_result)")

//4ºBimestre
var fourthbi_result: Double = ((fourthbi_tests[0] + fourthbi_tests[1] + fourthbi_tests[2]) / (Double(fourthbi_tests.count)));
print("Media 4 Bimestre: \(fourthbi_result)")


//var results: [Double] = [firstbi_result]

//Média final
let media_final = ((bimestres[0] + bimestres[1] + bimestres[2] + bimestres[3]) / Double(bimestres.count));
print("Média final: \(media_final)")
*/

(media_final >= 6) ? print("Aprovado!") : print("Reprovado!")
