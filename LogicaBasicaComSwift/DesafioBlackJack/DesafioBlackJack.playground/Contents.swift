import UIKit
//import Foundation

/*Infos

- players + dealer(desk)
- cards from 2-10
- cards J,Q and K = 10
- card A = 1 OR 11 (it depends from what is better for the player)
- each player receive 2 cards, adding up the value of your cards

if sum > 21 -> lost // sum < 21 -> continue and receive one more card OR stop // sum == 21 -> win


Player -> receber cartas, pedir carta e parar
Dealer -> dar cartas para os players, dar carta para mesa(si mesmo)

*/
//------------------------------------------------------------

//code


enum Cards:Int, CaseIterable {
    
    case ace
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case ten
    case J
    case Q
    case K
    
    var valueCards:Int {
        switch self {
        
        case .ace:
            return 1
        case .two:
            return 2
        case .three:
            return 3
        case.four:
            return 4
        case .five:
            return 5
        case .six:
            return 6
        case .seven:
            return 7
        case .eight:
            return 8
        case .nine:
            return 9
        case .ten, .J, .K, .Q:
            return 10
        }
    
    }
}


var baralho: [[Int]] = [
    [1,1,1,1], [2,2,2,2], [3,3,3,3], [4,4,4,4], [5,5,5,5],
    [6,6,6,6], [7,7,7,7], [8,8,8,8], [9,9,9,9],[10,10,10,10],
    [10,10,10,10],[10,10,10,10],[10,10,10,10]]
    //J             Q                  K


struct Players {
    //atributes/properties
    var name: String = ""
    var hand: [Int] = []
    var sumCards: Int = 0
    
    //methods/functions
    func getHand() -> [Int] {
        return self.hand
    }
    
    mutating func setName(_ nome:String) -> Void {
        self.name = nome
    }
    
    mutating func generateRandomCard() -> Int {
        guard let randomCard = baralho.randomElement()?.randomElement() else {return 0}
        return randomCard
    }
    
    mutating func addCardToHand() -> Bool {
        if self.generateRandomCard() != 0 {
            hand.append(generateRandomCard())
            return true
        } else {
            return false
        }
    }
    
    mutating func sumValueHand() -> Int {
        var sum = 0
        for card in getHand() { //card is a Int
            sum += card
        }
        self.sumCards = sum
        return sum
    }
    
    func getSumCards() -> Int {
        return self.sumCards
    }
    
}

struct Dealer {
    //atributes/properties
    var desk: [Int] = []
    var sumCards: Int = 0
    
    //methods/functions
    func getDesk() -> [Int] {
        return self.desk
    }
    
    mutating func generateRandomCard() -> Int {
        guard let randomCard = baralho.randomElement()?.randomElement() else {return 0}
        return randomCard
    }
    
    mutating func addCardToDesk() -> Bool {
        if self.generateRandomCard() != 0 {
            desk.append(generateRandomCard())
            return true
        } else {
            return false
        }
    }
    
    mutating func sumValueDesk() -> Int {
        var sum = 0
        for card in getDesk() { //card is a Int
            sum += card
        }
        self.sumCards = sum
        return sum
    }
    
    func getSumCards() -> Int {
        return self.sumCards
    }
    
}

// Testing the game!

var player1 = Players(name: "Lucas")
var dealer = Dealer()

//At the start of the game, delivery 2 cards for player and desk
dealer.addCardToDesk()
player1.addCardToHand()

repeat {

dealer.addCardToDesk()
player1.addCardToHand()
    
//sum the cards
dealer.sumValueDesk()
player1.sumValueHand()

print("Desk cards: \(dealer.getDesk()), Sum: \(dealer.getSumCards())")
print("Player1 cards: \(player1.getHand()), Sum: \(player1.getSumCards())")

} while (player1.getSumCards() <= 21 && dealer.getSumCards() <= 21)

if player1.getSumCards() == 21 && dealer.getSumCards() != 21{
    print("\(player1.name) ganhou!\n(jogador chegou a 21!)")
} else if player1.getSumCards() == 21 && dealer.getSumCards() == 21 {
    print("Empate!\n(ambos chegaram a 21!)")
} else if player1.getSumCards() < dealer.getSumCards() {
    print("\(player1.name) ganhou!\n(jogador chegou mais perto a 21)")
} else if player1.getSumCards() > 21 && dealer.getSumCards() < 21 {
    print("Dealer ganhou!\n(jogador ultrapassou 21)")
}



