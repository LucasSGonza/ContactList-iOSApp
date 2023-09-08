import UIKit


//função recebendo como parâmetros valores opcionais e definindo dentro da função um valor padrão caso o valor do parâmetro venha como nil (null)
func calcMedia(_ num1:Double?, _ num2:Double?) -> Double {
    let media = ( (num1 ?? 0) + (num2 ?? 0) ) / 2
    return (media)
}


//mesmo caso do de cima mas testando forçar o despacotamento
func calcMedia2(_ num1:Double?, _ num2:Double?) -> Double {
    if (num1 != nil && num2 != nil) { //simula um if let?
        let media = (num1! + num2!) / 2
        return media
    } else {
        return 0
    }
}
 

//função testando utilizar 'if let' para verificar se existe valor ou não nos parâmetros opcionais
func calcMedia3(_ num1:Double?, _ num2:Double?) -> Double {
    if let number1 = num1 {
        if let number2 = num2 {
            let media = (number1 + number2) / 2
            return media
        }
    }
    return 0
}


//function testando 'if let' para verificar se existe valor na opcional, mas desta vez utilizando um 'else' para lá definir um valor padrão igual a 0 caso a opcional seja nil
func calcMedia4(_ num1:Double?, _ num2:Double?) -> Double {
    if let number1 = num1 {
        if let number2 = num2 {
            let media = (number1 + number2) / 2
            return media
        }
    }
    let number1 = num1 ?? 0
    let number2 = num2 ?? 0
    let media = (number1 + number2) / 2
    return media
}


//variavel recebendo uma closure nos mesmos parâmetros que as functions acima, mas desta vez utilizando 'guard let'
let calcMedia5 = { (_ num1:Double?, _ num2:Double?) -> Double in
    guard
        let number1 = num1 ,
        let number2 = num2
    else { return 0 } //return único para várias condições falsas
    //utilizando o guard let, caso o programa chegue nessa linha, estará garantido que as variáveis possuem valor
    return ((number1 + number2) / 2)
}


//print(calcMedia(nil, 8))
//print(calcMedia2(nil, 7))
//print(calcMedia3(6, 10))
//print(calcMedia4(nil, 10))
print(calcMedia5(nil,10))
