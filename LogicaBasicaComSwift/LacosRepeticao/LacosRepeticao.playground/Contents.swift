import UIKit

/*
//teste 1
var sequencia: [Int] = [];
var nums: [Int] = [1,2,3,4,5,6,7,8,9,10];
sequencia.append(contentsOf: nums);
print(sequencia);

//teste 2
let sequencia2 = sequencia.filter({$0 % 2 == 0})
print(sequencia2)

//teste 3
var sequencia3: [Int] = []
for i in (0...sequencia.count) where (i % 2 == 0) {
    sequencia3.append(i)
}
print(sequencia3)

//teste 4
let sequencia4 = 1...5
for num in sequencia4 {
    print(num)
}
*/
/*
//teste 5
var sequencia5: [String] = ["Lucas","Leticia","Mano Menezes"]
for names in sequencia5 where names.localizedStandardContains("L") {
    print(names)
}


//teste 6
sequencia5.forEach { word in
    if word.localizedStandardContains("M") {
        print(word)
    }
}
*/
/*
func calculo(_ number1:Int = 0, _ number2:Int = 0) -> Int {
    let sum = number1 + number2
    return sum
}
print(calculo(1,2))
*/

//tabuada (max 7 linhas código)
for num in 0...10 {
    for i in 0...10{
        print("\(num) x \(i) = \(num * i)")
    }
    print("------")
}
