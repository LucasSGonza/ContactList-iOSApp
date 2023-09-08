import UIKit

var options: [String] = ["Pedra","Papel","Tesoura"]

class Game {
    
    var playerChoice : String = "" {
        willSet {
            computerChoice = options.randomElement()!
        }
        didSet {
            verifyWinner(playerChoice, computerChoice)
        }
    }
    var computerChoice: String = ""
    var result : String = ""
    
    func verifyWinner(_ escolhaJogador: String, _ escolhaComputador: String) -> Void {
        if escolhaJogador == escolhaComputador {print("Empate!")}
        else if
            (escolhaJogador == "Pedra" && escolhaComputador == "Tesoura") ||
            (escolhaJogador == "Papel" && escolhaComputador == "Pedra") ||
            (escolhaJogador == "Tesoura" && escolhaComputador == "Papel")
        {
            print("Jogador (\(playerChoice)) venceu!")
        }
        
        else if
            (escolhaComputador == "Pedra" && escolhaJogador == "Tesoura") ||
            (escolhaComputador == "Papel" && escolhaJogador == "Pedra") ||
            (escolhaComputador == "Tesoura" && escolhaJogador == "Papel")
        {
            print("Computador (\(computerChoice)) venceu!")
        }
    }
    
}

var teste = Game()
teste.playerChoice = options.randomElement()! //ao definir um valor para o atributo 'playerChoice', ele automaticamente tbm define para o atributo 'computerChoice', por causa do willSet{}

print(teste.playerChoice)
print(teste.computerChoice)
