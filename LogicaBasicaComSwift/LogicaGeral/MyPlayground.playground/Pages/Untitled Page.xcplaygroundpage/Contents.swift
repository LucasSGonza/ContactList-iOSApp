import UIKit

/*
 //Testando simples Strings/Prints
 
 var str = "Hello, playground";
 print(str);
 
 var message = "Ola, ";
 message += "Lucas";
 print(message);
 */


/*
//Testando declarações, numeros, contas,...
let num1:Double = 7,
    num2:Double = 8,
    num3:Double = 9;
let mediaAluno: Double = (num1 + num2 + num3)/3;
let mediaEscola: Double = 6;

//print("Média aluno: ", mediaAluno);
print("Média aluno: \(mediaAluno)\nMédia escola: \(mediaEscola)");

/*
 let a = String(mediaAluno);
 print("Média: " + a);
 */

mediaAluno >= mediaEscola ? print("Aluno aprovado!") : print("Aluno reprovado!");
*/


/*
 //Testando condições
 let isHungry: Bool = false;
 
 if (isHungry == true){
 print("Vá comer");
 } else {
 print("Faça nada")
 }
 
 let product: String;
 let company: String = "Apple";
 
 /*
 if company == "Google" {
 product = "Android";
 } else {
 product = "iPhone";
 }
 */
 
 product = ((company == "Google") ? "Android" : "iPhone");
 product == "iPhone" ? print("tem iPhone") : print("tem Android");
 
 print("Empresa: ",company, "\nProduto: ", product);
 */


/*
 TUPLA
 
//tupla que possui as caracteristicas do gravador (DVR ou NVR, tipo, modelo)
let gravador = (dvr_nvr:"DVR",tipo:"MHDX",modelo:"MHDX 1332");
//print(gravador);
print("Gravador: \(gravador.0)\nTipo: \(gravador.tipo)\nModelo: \(gravador.modelo)");
*/


/*
 //ARRAY
 
//let classB: [String] = [] -> pode inicializar vazia
var classA: [String] = ["Lucas", "Leticia","Silva","Kleber"];
print(classA)

classA.remove(at: 3);
print(classA)

classA.append("Carlos")
print(classA)

let newStudents = ["Felipe","Daniel"];
classA.append(contentsOf: newStudents);
//classA += newStudents;

print(classA)
 */

/*
//DICTIONARY

var products: [Int:String] = [:]

//CREATE
products[0] = "Fone de ouvido"
//products.updateValue("Fone de Ouvido", forKey: 0) //método que adiciona ou atualiza um valor a partir da chave informada
products.updateValue("Teclado", forKey: 1)
print(products)

//UPDATE
//products[0] = "Fone"
products.updateValue("Mouse", forKey: 0)
print(products)

//DELETE
//products[0] = nil
products.removeValue(forKey: 0)
print(products)

//READ --> 3 tipos

//READ keys
for productKey in products.keys {
    print("chave: \(productKey)")
}

//READ values
for productValue in products.values {
    print("valor: \(productValue)")
}

//READ key-value
for (key, value) in products{
    print("key: \(key), value: \(value)")
}
*/
