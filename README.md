# JovemAprendizIntelbras
<p> 
  Repositório voltado para <b>organizar, registrar e manter</b> todos os conhecimentos adquiridos e desenvolvidos durante minha trajetória como <b>Jovem Aprendiz na     Intelbras</b>
</p>

<hr>
<details>
<summary><h2>Dicas sobre Git <img src='https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg' width=30px>:</h2></summary

<h3>Motivo para utilizar versionadores de código (como o Git):</h3>

-> organizar, distribuir e gerenciar várias versões de um software de forma eficiente

<hr>

<h3>Estrutura Inicial do Git:<\h3>
<ol>
  <li><b>git clone</b> => cria um clone do projeto (repositório) em nossa máquina local
  <li><b>git add .</b> => realiza a inclusão ou modificação dos arquivos no diretório local, preparando ele para ser entregue ao servidor remoto (commit -> push)
  <li><b>git commit</b> => confirma e salva as alterações para preparar para o envio (git commit -m 'mensagem', para formalizar os commits
  <li><b>git push</b> => envia ao repositório remoto Git (sobe as alterações ao repositorio no GitHub)
</ol>

<hr>

<h3>Estrutura Normal do Git:<\h3>
<ol>
  <li><b>git pull</b> => busca e baixa o último conteudo salvo e atualizado do repositorio remoto (substitui o git clone)
  <li>Mesmo processo que antes (add -> commit -> push)
</ol>
<hr>

<h3>Outras infos:<\h3>

<ul>
  <li>Ramo principal e padrão => main
  <li>Repositório => local ou nuvem
</ul>

<hr>

<h3>Mais comandos:<\h3>
<ul>
  <li><b>git branch</b> => realizar operações com branches (criar, listar, renomear ou excluir)<br>
      link: https://blog.betrybe.com/git/git-branch/#1
  <li><b>git checkout</b> => alterar a branch ou restaurar arquivos (da pra usar o 'git checkout -b <nome branch>' para criar e já entrar nessa nova branch (ramificação) criada)<br>
link: https://blog.betrybe.com/git/git-checkout/#1
  <li><b>git status</b> => dá todas as informações necessárias sobre a branch atual.
  <li><b>git reset</b> => desfaz alterações (commits)
  <li><b>git rm</b> => remove arquivos
  <li><b>git mv</b> => move arquivos
</ul>
</details>
	
<hr>
	
<details>
<summary><h3>Links úteis:</h3></summary>
<ul>
  <li>https://comandosgit.github.io/
  <li>https://www.freecodecamp.org/portuguese/news/10-comandos-do-git-que-todo-desenvolvedor-deveria-conhecer/
  <li>https://medium.com/@rafaelpiresvb/programação-reativa-com-reactivex-no-swift-e-kotlin-71e8a78fe07f
  <li>https://replit.com/@LucasSGonza
  <li>https://updatedcode.wordpress.com/2016/06/13/3-swift-colecoes-e-tuplas/
  <li>https://www.hackingwithswift.com/example-code/system/how-do-you-read-from-the-command-line
  <li>https://developer.apple.com/documentation/swift/array/foreach(_:)
  <li>https://www.youtube.com/playlist?list=PLJ0AcghBBWShgIH122uw7H9T9-NIaFpP-
  <li>https://www.codecademy.com/learn/learn-swift/modules/learn-swift-hello-world/cheatsheet
  <li>https://app.becas-santander.com/pt-BR/program/bolsas-santander-santander-bootcamp-2023
</ul>
</details>
	
<hr>
    
<details>
<summary><h3><img src="https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white" width: "17px">:</h3></summary>

<h3>Links:</h3>
<ul>
	<li>https://www.codingame.com/playgrounds/66493/swift---variaveis-tipos-tuplas-enumeracoes-e-operadores
	<li>https://macmagazine.com.br/sobre/quaddro-macmagazine/
	<li>https://tiagoaguiar.co/xcode-shortcuts-teclas-de-atalho#:~:text=cmd%20%2B%20%5B%20%3A%3A%20unindent&text=Um%20bom%20desenvolvedor%20de%20software,atalho%20dentro%20do%20seu%20Xcode
	<li>https://www.tutorialspoint.com/swift-program-to-get-input-from-the-user#
	<li>https://www.codecademy.com/learn/learn-swift/modules/learn-swift-hello-world/cheatsheet
</ul>
	
<hr>

<h3>Características</h3>
<ul>
	<li> tipagem => tipo da variável é definido baseado no 1º valor que ela receber. Uma vez definido o tipo, este não poderá ser modificado
	<li> ' ; ' é opcional
	<li> "Xcode" => IDE oficial desenvolvida pela apple para desenvolvimento de SWIFT
	<li> readLine() -> funciona quase como o scan.nextLine() do Scanner do Java (utiliza do conceito de opcionais)
	<li> usar { } em métodos
</ul>
<pre>
usar ‘ _ ‘ (underline) significa que o valor não é necessário ser citado. Exemplo:
		
* for _ in 0…2 { print(‘Ola Mundo’) } —> irá simplesmente realizar o código do loop 3x
* func calcMedia (_ nota1: Double, _ nota2: Double ) { //codigo }
	
(nesse caso, por padrao as funções em swift utilizam de ‘label’ (tag/identificador) para cada parâmetro, 
ou seja, utlizando o ‘ _ ‘,vc retira a necessidade de, quando for chamar a função, ter que colocar as labels 
(no caso os nomes utilizados, no exemplo citado sendo nota1, nota2))

‘ ?? ‘ —> utiliza-se quando a variável é do tipo opcional, dessa forma, após as ??, coloca-se um valor padrão para a mesma.

	This operator is generally used to provide a default value when an expression or variable produces an 		optional result. for ex:
		let i: Int? = 5
		let j: Int? = nil

		let value1 = i ?? 9 //value1 will be 5 non-optional
		let value2 = j ?? 9 //value2 will be 9 non-optional

	You can chain multiple of these operators as such:
		let value3 = j ?? i ?? 9 //value3 will be 5 non-optional
</pre>
	
* Concatenação => 
	<pre>
	print (“Média: “, media) => usar + da erro. O “+” iria concatenar apenas se tudo fosse String.
	Dica: utilizamos “\(valor)” para inserirmos o valor de uma variável ou constante dentro de uma string (Interpolação).
	</pre>
	
<hr>

<h3>Sobre a linguagem</h3>

* Tipos de variáveis:
	* Var => variable variável (valor pode ser alterado)
	* Let => variable constante (valor não pode ser alterado)

<hr>

<h3>Tipos de Dados:</h3>
<ul>
	<li>Int
	<li>Double
	<li>String
	<li>Boolean
	<li>Character (char) => precisa ser declarado explícitamente (ex => var umChar: Character = “a”);
</ul>
	
<hr>

<h3>Tipos de declaração:</h3>
<pre>
ex: 
* let num; —> num = 1
* let num = 1;
* let num: Int = 2; 
</pre>
	
<hr>

<h3>Conversão de dados (type casting):</h3>
<pre>
Sintaxe: tipoDado(variável);
Ex:
Let x = 10;
Let name = String(x)
print(name) —> “10”
</pre>
	
* Como dito la nas “Características”, a tipagem é ‘automática’, mas definir o tipo da variável da 3º forma é de certa forma mais didática, facilitando o entendimento do código.

<hr>

<h3>Operadores Lógicos:</h3>
	
* No geral, igual as outras linguagens (<,>,//, ==, !=, !, +=, -=, …, &&, ||)
* https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/

<hr>

<h3>Condições:</h3>
<ul>
	<li>If, if/else, else if, switch => igual as outras linguagens
	<li>Operador ternário: sintaxe => 	expressão ? valor-seTrue : valor-seFalse;
</ul>
<hr>

<h3>Comentarios:</h3>
	
* Igual Java ( // ou /* */ )

<hr>

<h3>Tuplas:</h3>

* Sintaxe padrão => let numbers = (1,2,3)
* Funciona semelhante como uma matriz em Java (uma ‘variável’ ou um espaço de memória que agrupa vários valores, podendo ser de tipos distintos ou não)

* Sintaxe de criação com a mesma lógica das variáveis (pode definir o tipo explicitamente ou não)
* Caso for definir o tipo, precisa ser para cada item da tupla (oq talvez não seja tão produtivo), visto que cada item é “único” (a tupla serve simplesmente para armazenar)
* Pode ser inicializado vazia

* Por padrão, cada item da tupla pode ser acessado pelo seu índice, mas é possível atribuir ‘nomes’ para cada item (somente se o tipo não estiver declarado)=> let coords = (lat: 22.1, lng: 27.6)

<hr>

<h3>Array:</h3>

* Sintaxe padrão => let numbers = [1,2,3]

* Possuí a sintaxe de criação de uma matriz em Java (utilizando colchetes) e compartilha da característica de conter apenas valores de um MESMO TIPO
* Nesse sentido, caso queira definir o tipo de dado da Array durante a criação dela, basta definir somente uma vez, diferentemente da Tupla, que caso for definir o tipo, precisa ser para cada valor contido nela.
* Pode ser inicializado vazia

Alguns métodos usuais (alguns funcionam para tuplas tbm):
- append() -> adiciona na Array
- removeAll() -> auto-explicativo
- isEmpty -> auto-explicative
- count -> verifica tamanho da lista (igual o lenght ou size)
- contais() -> verifica na Array se existe o elemento indicado no parâmetro
- first -> access o primeiro elemento da Array
- insert(‘item’, at: ‘índice’) -> insere um elemento no índice indicado
- remove(at: ‘indice’) -> remove o item da Array no índice indicado
- removeLast() -> auto-explicativo mas remove o ultimo item da Array
- swapAt(0,1) -> meio auto-explicativo mas ele troca os elementos de posição (vc indica quais serão trocados)

https://developer.apple.com/documentation/swift/sequence/filter(_:) <br>
https://developer.apple.com/documentation/swift/array/map(_:)-87c4d <br>

<hr>

<h3>Dictionary:</h3>

https://www.codecademy.com/learn/learn-swift/modules/learn-swift-dictionaries/cheatsheet#:~:text=To%20remove%20a%20key%2Dvalue,removeAll()%20to%20a%20dictionary <br>

* Funciona muito semelhante a uma Array, mas utiliza do conceito de chave-valor (key-value), semelhante a um JSON
* É necessário definir na criação o tipo da chave e do valor
* Possuí métodos da mesma forma que Array, possuindo alguns métodos até idênticos, mas no geral os métodos realmente “são os mesmos” que na Array, mas atualizados para a sintaxe do dictionary.
* Os retornos dos valores sempre são como Opcionais

* Usos gerais:

    - Sintaxe de criação: 
	
		var products: [tipoChave : tipoValor] = [ : ] —> iniciando vazia

    - CRUD valores (sempre atento ao tipo da chave e do valor):
		* CREATE ja na criação do dicionario  —> var products: [Int : String] = [1 : “Fone de ouvido”]
		* CREATE/UPDATE normal —> products[1] = “Fone de ouvido”
		* MÉTODO CREATE/UPDATE —> dictionary.updateValue(valor, forKey: chave) —> add or update a key-value
		
		* DELETE meio estranho —> products[0] = nil —> nil significa a ausência de valor
		* MÉTODO DELETE mais legal —> removeValue(forKey: 0) —> a partir da chave informada, remove o item

		* READ de chave —> for key in products.key { print(key) }
		* READ de valor  —> for val in products.values { print(val) }
		* READ key-value —> for (key, value) in products { print (“chave: \(key), valor: \(valor)” }
	
<hr>

<h3>Sets:</h3>

* Semelhante a um Array, mas não permite itens repetidos
* Igualmente a Array, permite apenas 1 tipo (coleção de dados únicos de mesmo tipo)
	
* Sintaxe padrao —> 	var newSet: Set<tipo> = [ ]
	
* Sua utilização me parece mais específica do que em relação aos demais tipos de dados, além de talvez necessitar de um maior contexto para utilizá-la
<pre>
- Ex:

//simulando a Mega-sena

var numbers = 6
var result: Set<Int> = [ ]

while (numbers > 0) {
	let generated = Int.random (in: 1…60) //método que gera numeros aleatorios a partir do range definido
	let res = result.insert(generated) //só irá inserir no Set se o número gerado não for repetido
	if (res.inserted) {
		numbers - -
	}
}
</pre>

<hr>

<h3>Laços de Repetição:</h3>
<ul>
	<li>While => sintaxe padrão, igual em Java e JS (verifica a condição, dps executa o bloco de código)
	<li>Repeat/while => igual o do/while (execute o bloco de código, dps verifica a condição)
	<li>Sequências (ranges) => controlam o for
</ul>
<pre>
ex: 
let range = 0…5 // inclusive (incluí tudo)
let r = 0..<5 // exclusive (não incluí o limite)
</pre>

* for-in
<ul>
	<li>sintaxe 1=> for i in x...y { }
	<li>i => variável padrão, é imutável (let)
	<li> O for em swift utiliza bem da questão dos parâmetros genéricos, ent a variável i é somente uma opção para tal.
</ul>

<pre>
-> é possível utilizar da cláusula ‘where’ para colocar uma condição no loop. ex:

		for i in 1...10 where i % 2 == 0 { print(i) }
	
-> No geral, o loop for é mais fácil de interpretar traduzindo-o. ex:
	
	let sequencia = 1…5
	for num in sequencia {
		print(num) //exibira todos os itens de ‘sequencia’ 	}

-> sintaxe mais padrão ainda => 

	for item in items { 		// Do this 	}

-> nessa sintaxe, deixa mais claro a possibilidade de utilizar do for para iterar uma Array, da mesma forma que um forEach(). A vantagem do for, seria da possibilidade de iterar por uma Array de Array’s, ou seja, cada item da Array a ser iterada é uma outra Array
</pre>
	
https://www.programiz.com/swift-programming/for-in-loop <br>
https://www.appypie.com/loops-swift-how-to <br>
https://www.hackingwithswift.com/sixty/4/1/for-loops <br>

<hr>

<h3>BREAK e CONTINUE</h3>
<ul>
	<li>break —> utilizado para literalmente quebrar/parar algo, geralmente uma iteração em um loop ou no caso de utilizar de switch/case, por exemplo. Quando utilizado em loops, muito comum ser utilizado dentro de if’s (verificações), para não ser necessário validar tudo de algo (array por ex) quando já satisfez oq era procurado
	<li> continue —> pula uma iteração e passa para a próxima instrução ou bloco de código. Facilita quando uti
</ul>

<hr>

<h3>Functions:</h3>

* Muito semelhante às sintaxe dos métodos em Java e das functions em JavaScript, só muda o prefixo: func nomeFuncao () { }

* Da mesma forma que em Java, os parâmetros precisam de nome + tipo
* Se for utilizar do ‘return’ é necessário definir o tipo do retorno, mesma lógica que em Java, mas o tipo do retorno é definido após os parâmetros, da seguinte forma:
		func calcMedia (nota1: Double, nota2: Double) -> Double { }

* Por padrão, caso for omitido, o return é vazio
* Nos parâmetros, os nomes das ‘variaveis de parâmetro’ funcionam como labels, ou seja, caso não for utilizado um ‘ _ ‘ antes do nome da variavel, na hora de chamar o método e passar os argumentos, seria necessário citar os labels. EX:
		calcMedia(nota1: 7, nota2: 10)

<hr>

<h3>Closure:</h3>

https://www.programiz.com/swift-programming/closures <br>

* Funciona quase como uma Arroy function em JavaScript, no sentido de que a Closure é uma função resumida
<pre>
EX:

closure:							function
{ (a: Int, b: Int) -> Int in				func somar (a: Int, b: Int) -> Int {
   a + b								return a + b
}								}

-> Características:
	- pode ou não receber parâmetros
	- não é necessário uma palavra chave para declarar uma closure (como existe nas functions)
	- a declaração consiste nas { }
	- Sintaxe padrao: { (parametro) -> tipoRetorno in //codigo } 
	- o ‘in’ funciona como uma “—>” em JS
	- o ’—>’ serve para separar os parâmetros do tipo de retorno 
	- Pode ser passada como parâmetro de outras funções (callback function), como em um map por exemplo
</pre>

<hr>

<h3>Opcionais:</h3>
	
* Uma condição dada aos tipos de varíaveis na qual permite a ausência de valor (nil)
* resumidademente, permite valores nulos (tipo nulo [nil]) a variáveis , com tipos declarados (String, Int, Double, ...), visto que normalmente isso não seria permitido (ex: atribuir nil a uma variável que espera um valor Int)
	
* sintaxe =>  var variavel: tipoVariavel? , ex: let nota: Int?
	
* Como esse tipo de variável permite valores nulos, é necessário fazer algo para que, caso tente acessar um valor nulo, o programa nao dê problema. Para isso, existem 2 respostas padrão:
<pre>
	- Definir um valor padrão, caso ainda esteja como nil => ?? valor padrão , ex: var numbers = total ?? 60 
	(funciona como um if: caso tenha valor, seguirá utilizando o valor normalmente. Caso ainda esteja nil, utiliza o valor padrão)
	
	- Forçar um unwrapp na variável => 
	. usado quando temos certeza de que a variável, mesmo que opcional, terá um valor informado (e não será nil) durante a compilação
	. utiliza ! ao fim da variável
</pre>

* CUIDADO => caso seja passado um nil e seja usado ! para forçar, o programa dará fatal error. Para não acontecer este problema, existem maneiras de verificar se realmente é possível forçar um desembrulo da variável:
	
* <b>if let</b> <i>variavel</i> => faz uma verificação if para ver se a variável possuí valor.
	
	sintaxe => if let product = dict[id] { return product } else { return "nenhum produto encontrado" }
	
* <b>guard let</b> <i>variavel</i> => muito semelhante ao 'if let' mas realiza as operações em ordem trocada: primeiro verifica o erro, para ent seguir com o sucesso (true)
	
	sintaxe => guard let product = dict[id] else { return "nenhum produto encontrado" } return product

* QUANDO USAR => semelhante ao NOT NULL em SQL, ou seja, geralmente utilizado após verificar se é necessário ou não existir um valor. In fact, esse é um dos motivos para existir esse tipo, visto que serve para tratar, por exemplo, valores nulos vindo de um BD, visto que no BD podem existir campos que permitem serem nulos, fazendo com que em nosso sistema realizassemos a mesma lógica, definindo algumas variáveis como <i>opcionais</i>.
	
<hr>
	
<h3>Type Casting:</h3>
	
* utilizado para detecer o tipo dos objetos (como o TypeOf em JS), mas também se determinada classe faz parte de uma determinada hierarquia, por exemplo.
	
* 2 operadores => IS , AS (relativamente intuitivos)
	
- IS => funciona como um if, no caso como se fosse uma afirmação, que retornará um booleano
	ex: nota is Double //true
	    nome is Int //false
	
- AS => funciona como uma atribuição (como em SQL), no caso indicando um tipo para a variável/objeto caso este não esteja explícito. É utilizado juntamente dos operadores '!' e '?', assim como nas opcionais
	ex: nome as! String //forçar o desempacotamento (usado quando se tem certeza do tipo da variável)
	    email as? String   //tentará mudar o tipo para String, mas retornará nil caso não consiga

<hr>

https://www.youtube.com/watch?v=pgHzqTXwkLI&t=6s <br>
	
<h3>Enum:</h3>

* Basicamente é uma lista de itens. Contudo, cada item é um 'case' (o mesmo utilizado em swift), logo, podem ser atribuídos códigos para cada case utilizando um switch (fora da estrutura do enum)
	
* O tipo do enum não precisa necessariamente ser especificado, além dele poder armazenar valores de qualquer tipo e os tipos destes valores poderem ser diferentes para cada membro do enum (logo, deve-se avaliar se vale a pena limitar o tipo do enum ou de seus case's)
	
	- Life hack: se definir a enum para Int e nos cases não definirmos uma sequencia, os valores serão auto-incrementais (ex: enum Dia: Int { case Domingo = 1, Segunda, Terça, .... } Dia.Segunda.rawValue //2
	
* <i>Raw Value</i> => 'método' para pegar o valor do case
* Ao inves do rawValue, pode ser mais adequado utilizar um switch self
	
* Motivos para utilizar;
 --> Reduzir linhas de códigos ao simplesmente pegar o case e seu rawValue <br>
 --> Definir nomes para variáveis que serão utilizadas várias vezes (agilizando seus acessos), e que possuem valores padrões<br>
	
* É do tipo 'Reference Type', assim como as 'Class'
	
<hr>
	
https://www.youtube.com/watch?v=tKSNjg9Cb_g&list=PLZPWdr0WUuJ93mjCDaxLM8ZOi_5BwG7iC&index=6 <br>
	
<h3>Struct:</h3>

* Muito semelhante ao conceito de classes de Java e JS, mas é mais simples, visto que o Struct não permite herança, além de existir um 'class' em Swift, ent deve-se tomar cuidado para não misturar os conceitos
* Outra diferença para as classes, é que o Struct trabalha com o tipo VALOR. Nesse sentido, é possível criar apenas uma instância de objeto e dps criar novas variáveis e atribuir o VALOR sendo o primeiro objeto instanciado.
* Em resumo, os objetos do tipo Struct, não são necessariamente únicos, pois podem ser feitas CÓPIAS de um único objeto criado
* Logo, é do tipo 'Value Type', assim como Arrays, Dictionarys, Tuplas

* sintaxe => 		let player1 = Player()

<hr>
	
<h3>Class:</h3>

* De forma geral, são os mesmos conceitos, técnicas e lógicas de classes das vistas em Java.
	
* Trabalham com REFERÊNCIA, ou seja, cada instância será um local da memória diferente, portanto deve-se atentar ao modo de como será instanciado um objeto (visto que pode ser feita REFERÊNCIA ao mesmo local de memória). De modo geral, o processo é o seguinte: 
	
	1. instânciar um objeto (ex: let jogador1 = Jogador())
	2. caso eu queira instanciar um novo objeto da class Jogador, eu devo instanciar novamente um novo objeto, e não tentar fazer o seguinte:
	
	let jogador2 = jogador1 
	
	(nesse caso, tanto jogador1 quanto jogador2 estao fazendo REFERÊNCIA ao mesmo espaço de memória e, portanto, ao mesmo objeto. Logo, qualquer alteração das propriedades desse objeto serão observadas em ambas as variáveis)	
	
* sintaxe => 		var pessoa : Pessoa = Pessoa()
	
<hr>	
	
<h3>Semelhanças e Diferenças entre 'Class' e 'Struct'</h3>	
	
* Tanto em Struct quanto em Class, deve-se atentar a 2 casos (pelo que eu ja vi agr ja deu cagada kk):
* Caso nao definir um valor inicial para um atributo, deve ser criado um metodo inicializador (construtor)
* Nao pode criar um metodo construtor vazio -> visto que esse conceito acontece quando definimos valores iniciais aos atributos, permitindo que instanciemos um objeto sem ter que definir seus atributos logo de cara
* Se nao quiser criar um metodo construtor, deve-se definir um valor inicial para cada atributo (geralmente é tipo "", 0, ...)
	
* Método Inicializador (mesmo conceito do método construtor de Java)
	- sintaxe: 	init (parameters) {
			   statements	
			}
	
————
	
<b>Encapsulamento</b> 
	
* Mesmo conceito de Java, ent serve pra definir os tipos de acesso às classes, propriedades e métodos
	
Tipos:
* public – Permite acesso a qualquer outro elemento.
* internal – Permite acesso apenas dentro da própria classe e nas classes herdeiras.
* private – Permite acesso apenas dentro da classe na qual foi declarada.
	
OBS:
* por padrão, o nível de encapsulamento é internal.
* o encapsulamento do Swift funciona apenas se a classe e sua instância estiverem em arquivos separados.

————
	
<b>'willSet' e 'didSet'</b>

* Os observadores 'didSet' e 'willSet' provêm uma maneira de responder corretamente quando uma propriedade tem seu valor definido/alterado. 
* O observador willSet é chamado antes de o valor ser atribuído a uma propriedade
* O observador didSet é chamado depois de uma propriedade ter recebido um valor.
	
————
	
<b>Herança</b>
	
* Mesmo princípio das outras linguagens, portanto permite o compartilhamento (herança/herdar) os métodos e atributos entre classes
	
* sintaxe => 		classeFilha : classePai
	
* é como se vc estivesse atribuindo a uma classeFilha ser do tipo da classePai
* <i>IMPORTANTE:</i> A subclasse pode ter suas próprias propriedades e métodos, e estes não podem ser acessados pela superclasse, já que o fluxo da herança é sempre da superclasse para a subclasse
	
<b>Polimorsfismo</b>

* Novamente, funciona a partir do mesmo princípio das outras linguagens, então é a propriedade que permite a subClasse (classeFilha) sobrescrever métodos e propriedades de uma superClasse (classePai)	
* Tanto em Swift quanto em Java utiliza-se da mesma palavra reservada: <i>override</i>
* Novamente igual em Java, em Swift existe a palavra reservada <i>final</i> para definir como "final"/irretocável um atributo ou método
	
————
	
</details>
