import UIKit

func stringReversa(_ text:String) -> String {
    var reversedStringArray: [Character] = [] //Array para armazenar os caracteres da String informada
    
    //inverter sem método
    for char in text {
        reversedStringArray.insert(char, at: reversedStringArray.startIndex)
    }
    //inverter com método
    //reversedStringArray.reverse()
    
    print(reversedStringArray)
    
    //now we have the inverted String, but in a Array. So we just need to 'join' this characters to return them as a String. For this, i will use a for-in loop
    
    var reversedString: String = ""
    for char in reversedStringArray {
        reversedString += String(char)
    }
    
    return reversedString
}

print(stringReversa("Lucas"))
