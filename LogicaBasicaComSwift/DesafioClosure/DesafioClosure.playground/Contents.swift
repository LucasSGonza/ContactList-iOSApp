import UIKit

var verificarDiferença =
{ (_ num:Int, _ num2:Int) -> String in
    var result:String
    print("A = \(num), B = \(num2)")
    if num == num2 {
        result = "Os números são iguais, não há diferença"
    } else {
        result = num > num2 ?
            "O Número A é maior e tem uma diferença de \(num - num2) para o número B" :
            "O Número B é maior e tem uma diferença de \(num2 - num) para o número A"
    }
    return result
}
print(verificarDiferença(3,3))
