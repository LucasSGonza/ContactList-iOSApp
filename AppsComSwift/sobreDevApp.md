# Principais coisas sobre meu desenvolvimento no app:

🔸 Deve-se instanciar no código principalmente os 'controls' (label, text, button,...) que irão ser modificados em algum momento da execução do app,
visto que se for apenas estilizar algo, mt provavel que apenas utilizando a Storyboard dê conta

🔸 Funções do 'Life Cycle' do app: lembrar que não é uma linha do tempo, no sentido de ter início -> meio -> fim sempre nessa ordem, principalmente
em relação ao 'meio', visto que existirão várias telas podendo serem abertas e fechadas, e não deve-se perder nada de conteúdo durante este processo

---

### CONSTRAINTS!

🔸 amarrações feitas nos itens da tela
🔸 define padrões de altura e largura de objetos da tela, bem como seus espaçamentos nas 4 dimensões (top, left, right, bottom) em relação a outro 
parâmetro (pode ser a outro objeto, a tela, ...)

### COMO EU FIZ...

🔸 limitei a largura e altura dos objetos para os valores padrões, para que em qualquer tela os objetos sejam como eu quero
🔸 amarrei o topo do objeto para fixar uma distância com o 1º elemento acima de cada obj
🔸 junto a isso, define ainda um padrão de posicionamento horizontal para todos os objetos como '0', ou seja, no centro da tela      

---

### Classes, Objetos e Métodos úteis:

🔸 UIAlertController => classe responsável pelos alertas (tipo um alert em js)
```
🔹 Sintaxe:

UIAlertController(title: String?, message: String?, preferredStyle: UIAlertController.Style)

🔹 Como é uma classe, quando eu instancio um objeto, posso utilizar de vários métodos que a class possui, como por ex:

let errorMessage = UIAlertController(title: "ERRO!", message: "Verifique os dados digitados e tente novamente", preferredStyle: .alert)

//errorMessage.message = "teste" --> altera o valor do atributo 'message' que coloquei quando instanciei o objeto
errorMessage.addAction(okButton)
```
🔸 UIViewController => classe para as minhas telas
```
🔹 present() --> exibir a tela
🔹 dismiss() --> retirar a tela
```
-----------------------
🔸 UIAlertAction => classe responsável por definir certas coisas sobre uma ação, geralmente um espaço para o usuário clicar e sair do alert.
```
sintaxe => UIAlertAction(title: String?, style: UIAlertAction.Style, handler: ((UIAlertAction) -> Void)? = nil)
```

❗ É usado juntamente do UIAlertController geralmente da seguinte maneira (utilizando o método addAction() do UIAlertController):
```
let successMessage = UIAlertController(title: "Sucesso!", message: "êxito em salvar o contato", preferredStyle: .alert)
successMessage.addAction(UIAlertAction(title: "OK", style: .default))
```
---

✅ Para ter a perfeita combinação entre as duas classes, deve-se por fim utilizar um método da ViewController chamado '<b><i>present( )</i></b>', de forma a
definitivamente apresentar o alerta criado. O Fluxo seria o seguinte:
```
1. let alert = UIAlertController(...) 
2. alert.addAction(UIAlertAction)
3. viewController.present(alert)
```
-----------------------
```
Ex:

let alert = UIAlertController(title: "My Alert", message: "This is an alert.", preferredStyle: .alert)

alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in 
NSLog("The \"OK\" alert occured.")}))

self.present(alert, animated: true, completion: nil)
```
-----------------------

🔸 UIStoryboard => utiliza para interagir com a storyboard
```
ex de instancia:

//new screen
let screenContactList = storyboard?.instantiateViewController(identifier: "contactListScreen") as! ViewController2

screenContactList.initView(contactList, delegate2: self)

navigationController?.pushViewController(screenContactList, animated: true)
```
-----------------------

🔸 NSAttributedString => edita strings (placeholders, textFields,...)
```
nameTextField.attributedPlaceholder = NSAttributedString(
            string: "Name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.green]
        )
nameTextField.textColor = UIColor.green

phoneTextField.attributedPlaceholder = NSAttributedString(
            string: "Phone",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.green]
        )
phoneTextField.textColor = UIColor.systemGreen
```
---

📱 Como instanciar novas telas!

🔹 Lógica muito parecida com em Java: você deverá de alguma forma definir que uma nova tela será exibida (ao clicar em um botão, por ex)

🔹 A ViewController é basicamente a nossa tela, ou seja, se queremos mais telas...

🔹 É preciso criar 2x: primeiro cria a nova tela no Storyboard (da mesma forma que se cria textfields, buttons,...), depois cria um novo arquivo
para a nova ViewController (basicamente para ter o código próprio dessa nova Tela)

------
Opção 🅰 (instanciando como objetos):

Link: https://www.youtube.com/watch?v=Dh7fa1fdzBo
```
1. Criar uma nova ViewController

2. Definir um ID

3. Instanciar a partir do método 'instantiateViewController' da 'storyboard'

4. Colocar o ID da ViewController que será instanciada, bem como a class(pode-se dizer arquivo) ViewController referente
```
```
EX:
@IBAction func readContactList(_ sender: UIButton) {
        //new screen
        let screenContactList = storyboard?.instantiateViewController(identifier: "contactListScreen") as! ContactViewController

        screenContactList.initView(contactList, delegate2: self)

        navigationController?.pushViewController(screenContactList, animated: true)
    }
```
❗ o 'as!' serve para referenciar qual a class ViewController será instanciada (por padrão/sem o as! é simplesmente ViewController). Assim,
passamos após o 'as!' a class específica da ViewController que deve ser inicializada

------

Opção 🅱 (SEGUES):

Link: https://www.youtube.com/watch?v=DxCydBmOqXU
```
1. Instanciar uma nova ViewController (ou seja, uma nova tela) -> pode ser pela propria Storyboard (igual for criar um novo botao, 'drag and hold')

2. Criar um button, clicar com o botão direito do mouse nele e arrastar até a tela que deseja ser aberta
```
---

🌎 GERAL:

🎹 Trocar tipo de teclado
```
🔸 aquele .numberpad funcionou no iphone 7 mas no 8 deu esse erro: 
"Can't find keyplane that supports type 4 for keyboard iPhone-PortraitChoco-NumberPad; using 25889_PortraitChoco_iPhone-Simple-Pad_Default"

DESCOBRI => .numberpad é um teclado antigo, só com numeros. Funciona em versoes antigas de iphone. Nas novas tem que ser outro, tem varios tipos
de keyboardtype testar:

.numberpad (n funcinou)
.phonepad (n funcionou)
.asciiCapableNumberPad (n funcionou)
```
----

👑 Table View:

Link: https://medium.com/@sarinyaswift/easy-tableview-setup-tutorial-swift-4-ad48ec4cbd45
(bom link)

(mais dicas sobre tableView estão comentadas no proprio código do projeto 'testezin')

---

📱 COMO PASSAR INFORMAÇÕES ENTRE AS TELAS!

🔸 Deve ser feito de forma 'protegida', na qual permite maior controle sobre os caminhos que a informação está passando (de onde vem, onde está, como foi, ...)
🔸 Para isso, utilizamos (no meu app de contatos) de um 'protocol' chamado 'Delegate':
```
🔹 Protocol => tipo uma class abstrata em Java, serve para dar override em seus métodos, economizando e flexibilizando o código

🔹 Delegate => será nossa instância desse protocol, na qual utilizaremos para passar as informações entre as ViewControllers
```
📑 Passo a Passo:
```
1. Criar o protocol com os métodos mais adequados. No meu caso ficou assim:
protocol toPassDataDelegate: AnyObject {
    func setContactList(_ list:[Contact])
    func showContactInfos() -> String
}

---

2. Definir qual ViewController herdará os métodos do protocol -> em meu projeto foi de onde as minhas infos estão sendo criadas

2.1 A Herança pode ser criada de 2 maneiras: (o mais recomendado para melhor organização do código seria a 2 opção)
- class ViewController: UIViewController, 'nomeDoProtocol' {}
- extension ViewController: 'nomeDoProtocol' {}

2.2 Completar os métodos (dar corpo a eles, visto que no protocol eles veem 'vazios'), já pensando no melhor jeito de pegar as informações desejadas
para posteriormente passá-las para a próxima ViewController

----

3. Com os métodos prontos, devemos agr pensar em como passar esse Delegate 'recheado' (com as infos) para a próxima tela. Para isso, em meu projeto 'testezin'
pensamos em passar na chamada da próxima tela, passando o delegate (no caso a própria ViewController, visto que a mesma HERDOU os métodos do protocol) como
parâmetro

3.1 Para fazer isso, criamos um método na 2ºViewController chamadado 'initView', na qual recebe 2 parâmetros:
func initView(_ list:[Contact], delegate2:toPassDataDelegate){
        self.contactList = list
        self.delegate = delegate2
    }

3.2 Observando esta func, já pode-se adiantar alguns passos a serem feitos na 2º tela, que seriam a criação de um atributo 'contactList' e de um 'delegate',
criando locais para armazenar as infos recebidas da 1º tela:
//Delegate -> 'objeto' que será do tipo do protocol, para poder utilizar de seus métodos e atributos
    private var delegate: toPassDataDelegate?
    
//Array que será cópia do meu bd na 1 ViewController
    private var contactList:[Contact] = []

---

4. Agr com tudo isso pronto, acredito que faltam poucas coisas a serem feitas. Primeiro, vamos ao botão que irá chamar a 2º ViewController:
@IBAction func readContactList(_ sender: UIButton) {
        //new screen
        let screenContactList = storyboard?.instantiateViewController(identifier: "contactListScreen") as! ViewController2
        screenContactList.initView(contactList, delegate2: self)
        navigationController?.pushViewController(screenContactList, animated: true)
    }

4.1 Com isso tudo feito, a partir do initView, a Array e o Delegate 'cheios' são passados e atribuidos para a 2º View Controller e ta show. Agora só falta
fazer esse initView 'ao contrário', no sentido de que as possíveis alterações feitas na 2º Tela voltem para a 1º. Para isso, utilizaremos do método
'setContactList' do delegate no botão 'goBack' (botão que irá retornar para a 1º tela):

    //PT-BR => func do botão para retornar para 1 ViewController
    @IBAction func goBack(_ sender: Any) {
        guard let delegate = delegate else {return}
        delegate.setContactList(contactList)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }

==============FIM===============
```
---
🎭 Mais coisas úteis:
```
Sobre NavigationBar in Code:

- Swift: Navigation Bar Buttons (2023, Xcode 12, Swift 5) - iOS Development for Beginners: 
https://www.youtube.com/watch?v=xDJ8eIYih1k

- https://letcreateanapp.com/2022/05/02/how-to-add-a-button-on-the-navigation-bar-in-swift-5/
```