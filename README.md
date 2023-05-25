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

<h3>Estrutura Inicial do Git:</h1>
<ol>
  <li><b>git clone</b> => cria um clone do projeto (repositório) em nossa máquina local
  <li><b>git add .</b> => realiza a inclusão ou modificação dos arquivos no diretório local, preparando ele para ser entregue ao servidor remoto (commit -> push)
  <li><b>git commit</b> => confirma e salva as alterações para preparar para o envio (git commit -m 'mensagem', para formalizar os commits
  <li><b>git push</b> => envia ao repositório remoto Git (sobe as alterações ao repositorio no GitHub)
</ol>

<hr>

<h3>Estrutura Normal do Git:</h3>
<ol>
  <li><b>git pull</b> => busca e baixa o último conteudo salvo e atualizado do repositorio remoto (substitui o git clone)
  <li>Mesmo processo que antes (add -> commit -> push)
</ol>
<hr>

<h3>Outras infos:</h3>

<ul>
  <li>Ramo principal e padrão => main
  <li>Repositório => local ou nuvem
</ul>

<hr>

<h3>Mais comandos:</h3>
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
</ul>
</details>
	
<hr>
    
<details>
<summary><h3>Swift:</h3></summary>

<h3>Links:</h3>

https://www.codingame.com/playgrounds/66493/swift---variaveis-tipos-tuplas-enumeracoes-e-operadores

https://macmagazine.com.br/post/2015/06/24/quaddro-macmagazine-vamos-aprender-swift/

https://macmagazine.com.br/post/2015/07/01/quaddro-macmagazine-swift-na-pratica-2-operadores/

https://macmagazine.com.br/post/2015/07/08/quaddro-macmagazine-swift-na-pratica-3-string-e-collection-types/

https://tiagoaguiar.co/xcode-shortcuts-teclas-de-atalho#:~:text=cmd%20%2B%20%5B%20%3A%3A%20unindent&text=Um%20bom%20desenvolvedor%20de%20software,atalho%20dentro%20do%20seu%20Xcode

https://www.tutorialspoint.com/swift-program-to-get-input-from-the-user#

https://www.codecademy.com/learn/learn-swift/modules/learn-swift-hello-world/cheatsheet

——————————————————————————————

<h3>Características</h3>

- tipagem => tipo da variável é definido baseado no 1º valor que ela receber. Uma vez definido o tipo, este não poderá ser modificado

- ' ; ' é opcional

-  "Xcode" => IDE oficial desenvolvida pela apple para desenvolvimento de SWIFT

- readLine() -> funciona quase como o scan.nextLine() do Scanner do Java (utiliza do conceito de opcionais)

- usar { } em métodos

- usar ‘ _ ‘ (underline) significa que o valor não é necessário ser citado. Exemplo:
	for _ in 0…2 { print(‘Ola Mundo’) } —> irá simplesmente realizar o código do loop 3x

	func calcMedia (_ nota1: Double, _ nota2: Double ) { //codigo }
	
	nesse caso, por padrao as funções em swift utilizam de ‘label’ (tag/identificador) para cada parâmetro, ou seja, utlizando o ‘ _ ‘, vc retira a necessidade de, quando for chamar a função, ter que colocar as labels (no caso os nomes utilizados, no exemplo citado sendo nota1, nota2)

-  ‘ ?? ‘ —> utiliza-se quando a variável é do tipo opcional, dessa forma, após as ??, coloca-se um valor padrão para a mesma.

	This operator is generally used to provide a default value when an expression or variable produces an 		optional result. for ex:
		let i: Int? = 5
		let j: Int? = nil

		let value1 = i ?? 9 //value1 will be 5 non-optional
		let value2 = j ?? 9 //value2 will be 9 non-optional

	You can chain multiple of these operators as such:
		let value3 = j ?? i ?? 9 //value3 will be 5 non-optional


- Concatenação => print (“Média: “, media) => usar + da erro. O “+” iria concatenar apenas se tudo fosse String.

	Dica: utilizamos “\(valor)” para inserirmos o valor de uma variável ou constante dentro de uma string 		(Interpolação).

——————————————————————————————

<h3>Sobre a linguagem</h3>

Tipos de variáveis:
* Var => variable variável (valor pode ser alterado)
* Let => variable constante (valor não pode ser alterado)

————

Tipos de Dados:
* Int
* Double
* String
* Boolean
* Character (char) => precisa ser declarado explícitamente (ex => var umChar: Character = “a”);

————

Tipos de declaração:
ex: 
* let num; —> num = 1
* let num = 1;
* let num: Int = 2; 

————

Conversão de dados (type casting):
* Sintaxe: tipoDado(variável);
Ex:
Let x = 10;
Let name = String(x)
print(name) —> “10”

Como dito la nas “Características”, a tipagem é ‘automática’, mas definir o tipo da variável da 3º forma é de certa forma mais didática, facilitando o entendimento do código.

————

Operadores Lógicos:
* No geral, igual as outras linguagens (<,>,//, ==, !=, !, +=, -=, …, &&, ||)

https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/

————

Condições:
* If, if/else, else if, switch => igual as outras linguagens
* Operador ternário:
Sintaxe => expressão ? valor-seTrue : valor-seFalse;

————

Comentarios:
* Igual Java ( // ou /* */ )

————

Tuplas:

* Sintaxe padrão => let numbers = (1,2,3)
* Funciona semelhante como uma matriz em Java (uma ‘variável’ ou um espaço de memória que agrupa vários valores, podendo ser de tipos distintos ou não)

* Sintaxe de criação com a mesma lógica das variáveis (pode definir o tipo explicitamente ou não)
* Caso for definir o tipo, precisa ser para cada item da tupla (oq talvez não seja tão produtivo), visto que cada item é “único” (a tupla serve simplesmente para armazenar)
* Pode ser inicializado vazia

* Por padrão, cada item da tupla pode ser acessado pelo seu índice, mas é possível atribuir ‘nomes’ para cada item (somente se o tipo não estiver declarado)=> let coords = (lat: 22.1, lng: 27.6)

————

Array:

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

https://developer.apple.com/documentation/swift/sequence/filter(_:)
https://developer.apple.com/documentation/swift/array/map(_:)-87c4d

————

Dictionary:

https://www.codecademy.com/learn/learn-swift/modules/learn-swift-dictionaries/cheatsheet#:~:text=To%20remove%20a%20key%2Dvalue,removeAll()%20to%20a%20dictionary

* Funciona muito semelhante a uma Array, mas utiliza do conceito de chave-valor (key-value), semelhante a um JSON
* É necessário definir na criação o tipo da chave e do valor
* Possuí métodos da mesma forma que Array, possuindo alguns métodos até idênticos, mas no geral os métodos realmente “são os mesmos” que na Array, mas atualizados para a sintaxe do dictionary.

* Usos gerais:

    - Sintaxe de criação: 
		var products: [tipoChave : tipoValor] = [ : ] —> iniciando vazia

    - CRUD valores (sempre atento ao tipo da chave e do valor):
		CREATE ja na criação do dicionario  —> var products: [Int : String] = [1 : “Fone de ouvido”]
		CREATE/UPDATE normal —> products[1] = “Fone de ouvido”
MÉTODO CREATE/UPDATE —> dictionary.updateValue(valor, forKey: chave) —> add or update a key-value
		
		DELETE meio estranho —> products[0] = nil —> nil significa a ausência de valor
MÉTODO DELETE mais legal —> removeValue(forKey: 0) —> a partir da chave informada, remove o item

		READ de chave —> for key in products.key { print(key) }
		READ de valor  —> for val in products.values { print(val) }
		READ key-value —> for (key, value) in products { print (“chave: \(key), valor: \(valor)” }
	
————

Sets:

* Semelhante a um Array, mas não permite itens repetidos
* Igualmente a Array, permite apenas 1 tipo (coleção de dados únicos de mesmo tipo)
* Sintaxe padrao —> var newSet: Set<tipo> = [ ]

- Sua utilização me parece mais específica do que em relação aos demais tipos de dados, além de talvez necessitar de um maior contexto para utilizá-la
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

————

Laços de Repetição:

* While => sintaxe padrão, igual em Java e JS (verifica a condição, dps executa o bloco de código)
* Repeat/while => igual o do/while (execute o bloco de código, dps verifica a condição)

Sequências (ranges) => controlam o for
ex: 
let range = 0…5 // inclusive (incluí tudo)
let r = 0..<5 // exclusive (não incluí o limite)

for-in
* sintaxe 1=> for i in x...y { }
* i => variável padrão, é imutável (let)
* é possível utilizar da cláusula ‘where’ para colocar uma condição no loop. ex:
	for i in 1...10 where i % 2 == 0 { print(i) }

* O for em swift utiliza bem da questão dos parâmetros genéricos, ent a variável i é somente uma opção para tal.
* No geral, o loop for é mais fácil de interpretar traduzindo-o. ex:
	let sequencia = 1…5
	for num in sequencia {
		print(num) //exibira todos os itens de ‘sequencia’ 	}

* sintaxe mais padrão ainda => 

	for item in items { 		// Do this 	}

nessa sintaxe, deixa mais claro a possibilidade de utilizar do for para iterar uma Array, da mesma forma que um forEach(). A vantagem do for, seria da possibilidade de iterar por uma Array de Array’s, ou seja, cada item da Array a ser iterada é uma outra Array
	
for ('normal')
* sintaxe igual as outras linguagens --> for var x = 1; x <= 10; x++ { }
* sintaxe padrão --> for <i>variavel</i>; <i>condição de repetição</i>; <i>ação após cada iteração</i>
	
https://www.programiz.com/swift-programming/for-in-loop
https://www.appypie.com/loops-swift-how-to
https://www.hackingwithswift.com/sixty/4/1/for-loops

————

BREAK e CONTINUE

* break —> utilizado para literalmente quebrar/parar algo, geralmente uma iteração em um loop ou no caso de utilizar de switch/case, por exemplo. Quando utilizado em loops, muito comum ser utilizado dentro de if’s (verificações), para não ser necessário validar tudo de algo (array por ex) quando já satisfez oq era procurado

* continue —> pula uma iteração e passa para a próxima instrução ou bloco de código. Facilita quando uti

————

Functions:

* Muito semelhante às sintaxe dos métodos em Java e das functions em JavaScript, só muda o prefixo: func nomeFuncao () { }

* Da mesma forma que em Java, os parâmetros precisam de nome + tipo
* Se for utilizar do ‘return’ é necessário definir o tipo do retorno, mesma lógica que em Java, mas o tipo do retorno é definido após os parâmetros, da seguinte forma:
		func calcMedia (nota1: Double, nota2: Double) -> Double { }

* Por padrão, caso for omitido, o return é vazio
* Nos parâmetros, os nomes das ‘variaveis de parâmetro’ funcionam como labels, ou seja, caso não for utilizado um ‘ _ ‘ antes do nome da variavel, na hora de chamar o método e passar os argumentos, seria necessário citar os labels. EX:
		calcMedia(nota1: 7, nota2: 10)

————

Closure:

https://www.programiz.com/swift-programming/closures

* Funciona quase como uma Arroy function em JavaScript, no sentido de que a Closure é uma função resumida

EX:

closure:							function
{ (a: Int, b: Int) -> Int in				func somar (a: Int, b: Int) -> Int {
   a + b								return a + b
}								}

—> Características:
- pode ou não receber parâmetros
- não é necessário uma palavra chave para declarar uma closure (como existe nas functions)
- a declaração consiste nas { }
- Sintaxe padrao: { (parametro) -> tipoRetorno in //codigo } 
- o ‘in’ funciona como uma “—>” em JS
- o ’—>’ serve para separar os parâmetros do tipo de retorno 
- Pode ser passada como parâmetro de outras funções (callback function), como em um map por exemplo

————

COISAS A FAZER:

* https://www.youtube.com/watchv=Lkv4bYzuH_Y&list=PLZPWdr0WUuJ93mjCDaxLM8ZOi_5BwG7iC&index=13

* https://macmagazine.com.br/post/2015/07/22/quaddro-macmagazine-swift-na-pratica-5-controle-de-fluxo-looping/

* https://macmagazine.com.br/post/2015/08/05/quaddro-macmagazine-swift-na-pratica-6-funcoes/

* https://macmagazine.com.br/post/2015/08/12/quaddro-macmagazine-swift-na-pratica-7-closures/

————
    </details>
