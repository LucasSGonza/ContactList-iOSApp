# JovemAprendizIntelbras

<div id='top' align='center'>
	<p>Repositório voltado para <b>organizar, registrar e manter</b> todos os conhecimentos adquiridos e desenvolvidos durante minha trajetória como <b>Jovem Aprendiz na Intelbras</b></p>
</div>

---

<div id='git'>
	<details>
		<summary style=
		'font-size:x-large'>
		<img src='https://git-scm.com/images/logos/downloads/Git-Icon-1788C.svg' width=20px> Dicas Sobre Git:</summary>
		<div>
			<h3>📥 Importando um repositório</h3>
			<hr>
			<ol>
				<i>
				<li><b>git clone</b><br><pre>cria um clone do projeto (repositório) em nossa máquina local</pre>
				<li><b>git add '{arquivos}'</b><br><pre>realiza a inclusão ou modificação dos arquivos no diretório local, preparando ele para ser entregue ao servidor remoto</pre>
				<li><b>git commit -m '{mensagem}'</b> <pre> confirma e salva as alterações para preparar para o envio</pre>
				<li><b>git push</b><br><pre>envia ao repositório remoto Git (sobe as alterações ao repositorio no GitHub)</pre>
				</i>
			</ol>
			<br>
			<h3>❗ Alguns comandos adicionais, mas importantes</h3>
			<hr>
			<p>
				<i>
				▪ <b>git add .</b><pre>seleciona todos os arquivos locais </pre>
				▪ <b>git push origin '{branch}'</b><pre>especifica a branch na qual receberá o push</pre>
				▪ <b>git remote add origin '{link repositorio}'</b><pre>é usado para adicionar um repositório remoto como uma referência em seu repositório local. Ele define a conexão entre o seu repositório local e o repositório remoto, permitindo que você envie e receba alterações entre os dois</pre>
				▪ <b>git branch</b><pre>realizar operações com branches (criar, listar, renomear ou excluir) link: https://blog.betrybe.com/git/git-branch/#1</pre>
				▪ <b>git checkout</b><pre>alterar a branch ou restaurar arquivos (da pra usar o 'git checkout -b {nome branch}' para criar e já entrar nessa nova branch (ramificação) criada). 
link: https://blog.betrybe.com/git/git-checkout/#1</pre>
				▪ <b>git status</b><pre>dá todas as informações necessárias sobre a branch atual</pre>
				▪ <b>git reset</b><pre>desfaz alterações (commits)</pre>
				▪ <b>git rm</b><pre>remove arquivos</pre>
				▪ <b>git mv</b><pre>move arquivos</pre>
				▪ <b>git pull</b>
				<pre>
- Busca e baixa o último conteudo salvo e atualizado do repositorio remoto
- É usado para trazer as atualizações mais recentes de um repositório remoto para o seu repositório local. 
- O git pull é usado quando você já tem um repositório local e deseja sincronizá-lo com o repositório remoto, obtendo as últimas alterações.</pre>
				</i>
			</p>
			<hr>
			<h4>📘 Exemplo:</h4>
			<pre>
- create a new repository on the command line
🔸 git init
🔸 git add README.md
🔸 git commit -m "first commit"
🔸 git branch -M main
🔸 git remote add origin https://github.com/LucasSGonza/testezin.git
🔸 git push -u origin main
<hr>
- push an existing repository from the command line
🔸 git remote add origin https://github.com/LucasSGonza/testezin.git
🔸 git branch -M main
🔸 git push -u origin main</pre>
		</div>
	</details>
</div>

---

<div id='links'>
	<details>
		<summary style='font-size:x-large'>🔗 Links</summary>
		<h4>🌎Links Gerais</h4>
		<pre>
➡ <a>https://gitfichas.com/</a><br>
➡ <a>https://comandosgit.github.io/</a><br>
➡ <a>https://www.freecodecamp.org/portuguese/news/10-comandos-do-git-que-todo-desenvolvedor-deveria-conhecer/</a><br>
➡ <a>https://medium.com/@rafaelpiresvb/programação-reativa-com-reactivex-no-swift-e-kotlin-71e8a78fe07f</a><br>
➡ <a>https://replit.com/@LucasSGonza</a><br>
➡ <a>https://updatedcode.wordpress.com/2016/06/13/3-swift-colecoes-e-tuplas/</a><br>
➡ <a>https://www.hackingwithswift.com/example-code/system/how-do-you-read-from-the-command-line</a><br>
➡ <a>https://www.youtube.com/playlist?list=PLJ0AcghBBWShgIH122uw7H9T9-NIaFpP-</a><br>
➡ <a>https://www.youtube.com/watch?v=EFYdfF9r6cM</a><br>
➡ <a>https://www.codecademy.com/learn/learn-swift/modules/learn-swift-hello-world/cheatsheet</a><br>
➡ <a>https://www.codingame.com/playgrounds/66493/swift---variaveis-tipos-tuplas-enumeracoes-e-operadores</a><br>
➡ <a>https://macmagazine.com.br/sobre/quaddro-macmagazine/</a><br>
➡ <a>https://tiagoaguiar.co/xcode-shortcuts-teclas-de-atalho#:~:text=cmd%20%2B%20%5B%20%3A%3A%20unindent&text=Um%20bom%20desenvolvedor%20de%20software,atalho%20dentro%20do%20seu%20Xcode</a><br>
➡ <a>https://www.tutorialspoint.com/swift-program-to-get-input-from-the-user#</a><br>
➡ <a>https://www.codecademy.com/learn/learn-swift/modules/learn-swift-hello-world/cheatsheet</a>
  		</pre>
		<h4>📱 Desenvolvimento Mobile<h4>
		<pre>
➡ <a>https://www.alura.com.br/artigos/ios-swift-diferencas-construcao-layouts-storyboard-xib-view-code?gclid=CjwKCAjwp6CkBhB_EiwAlQVyxTN_Ww64Fd-mqoph6pqmOBo-G1BNj3CfPyQqXxegOwGjbAr8yUsJPBoCj5kQAvD_BwE</a><br>
➡ <a>https://medium.com/good-morning-swift/ios-view-controller-life-cycle-2a0f02e74ff5</a><br>
➡ <a>https://caiocnoronha.medium.com/como-passar-entre-p%C3%A1ginas-no-xcode-f7613820d912</a><br>
➡ <a>https://www.youtube.com/watch?v=XzyF36Wun3U</a><br>
➡ <a>https://www.youtube.com/watch?v=DxCydBmOqXU</a><br>
➡ <a>https://www.youtube.com/watch?v=09TeUXjzpKs</a><br></pre>
	</details>
</div>

---

<div id='swift'>
	<details>
		<summary style='font-size:x-large'>
		<img src='https://img.shields.io/badge/Swift-FA7343?style=flat&logo=swift&logoColor=white' width='73px'></summary>
		<div id="caracteristicaslinguagem">
			<details>
			<summary style='font-size:medium'>📚 Características da Linguagem</summary>
			<pre>
🔸 Tipagem --> tipo da variável é definido baseado no 1º valor que ela receber. Uma vez definido o tipo, este não poderá ser modificado<br>
🔸 ' ; ' é opcional<br>
🔸 "Xcode" --> IDE oficial desenvolvida pela apple para desenvolvimento de SWIFT<br>
🔸 Uso do ' _ '<pre>
usar ‘ _ ‘ (underline) significa que o valor não é necessário ser citado. Exemplo: <br>
* for _ in 0…2 { print(‘Ola Mundo’) } —> irá simplesmente realizar o código do loop 3x
* func calcMedia (_ nota1: Double, _ nota2: Double ) { //codigo } <br>
--> nesse caso, por padrao as funções em swift utilizam de ‘label’ (tag identificador) para cada parâmetro, ou seja, utlizando o ‘ _ ‘,vc retira a necessidade de, quando for chamar a função, ter que colocar as labels, no caso os nomes utilizados, no exemplo citado sendo nota1, nota2
</pre>
🔸 Programando com 'Opcionais': deve-se tomar cuidado ❗<pre>
‘ ?? ‘ —> utiliza-se quando a variável é do tipo opcional, dessa forma, após as ??, coloca-se um valor padrão para a mesma.<br>
This operator is generally used to provide a default value when an expression or variable produces an optional result. for ex:<br>
<i>let i: Int? = 5
let j: Int? = nil
let value1 = i ?? 9 //value1 will be 5 non-optional
let value2 = j ?? 9 //value2 will be 9 non-optional</i><br>
You can chain multiple of these operators as such:
<i>let value3 = j ?? i ?? 9 //value3 will be 5 non-optional</i></pre>
🔸 Concatenação<pre>
print (“Média: “, media) --> usar + da erro. O “+” iria concatenar apenas se tudo fosse String.<br>
Dica: utilizamos “\(valor)” para inserirmos o valor de uma variável ou constante dentro de uma string (Interpolação).
</pre></pre>
			</details>
			<hr>
			<details id='adentrandologica'>
				<summary style='font-size:medium'>♟ Adentrando na Lógica</summary>
				<h4>🎲 Tipos de dados</h4>
				<pre>
🔸 Int		🔸 Double			🔸 Float
🔸 String	🔸 Character (char)		🔸 Bool (boolean)
🔹 Array	🔹 Dictionary			🔹 Set
🔹 Enum		🔹 Tuple			❔ Optional
💥 Class	💥 Struct			💥 Protocol
💫 Any
...</pre>
				<h4>💾 Tipos de declaração geral</h4>
				<pre>
* let num; —> num = 1
* let num = 1;
* let num: Int = 1; </pre>
				<h4>💱 Conversão de dados <i>(type casting)</i></h4>
				<pre>
Como foi citado anteriormente nas <a href=#caracteristicaslinguagem>'Características da linguagem'</a>, uma vez declarado o tipo da variável, não é mais possível trocar seu tipo. Contudo, ainda pode ser feita uma 'adaptação':<br>
Sintaxe 1: tipoDado(variável);
Ex:
Let x = 10;
Let name = String(x)
print(name) —> “10”</pre>
🔸 Existe ainda alguns operadores muito utilizados quando o assunto é tipagem:
<pre>🔹 2 operadores => IS , AS (relativamente intuitivos)<br>
🍺 IS --> funciona como um if, no caso como se fosse uma afirmação, que retornará um booleano. Ex:<pre>
nota is Double //true
nome is Int //false</pre>
🍷 AS --> funciona como uma atribuição (como em SQL), no caso indicando um tipo para a variável/objeto caso este não esteja explícito. É utilizado juntamente dos operadores '!' e '?', assim como nas opcionais. Ex:<pre>
//forçar o desempacotamento (usado quando se tem certeza do tipo da variável)
nome as! String<br>
//tentará mudar o tipo para String, mas retornará nil caso não consiga
email as? String</pre>
</pre>
				<h4>🎮 Operadores Lógicos</h4>
				<pre>No geral, igual as outras linguagens (<,>,//, ==, !=, !, +=, -=, …, &&, ||)
link:
<a>https://docs.swift.org/swift-book/documentation/the-swift-programming-language/basicoperators/</a>
</pre>
				<h4>❓ Operadores Condicionais</h4>
				<pre>
If, if/else, else if, switch --> igual as outras linguagens
Operador ternário: sintaxe --> expressão ? valor-seTrue : valor-seFalse;
				</pre>
				<h4>🗣 Comentários</h4>
				<pre>Igual Java --> // ou /* */</pre>
				<h4>😀 Tuplas</h4>
				<pre>
🔸 Sintaxe padrão => let numbers = (1,2,3)
🔸 Funciona semelhante como uma matriz em Java (uma ‘variável’ ou um espaço de memória que agrupa vários valores, podendo ser de tipos distintos ou não)
🔸 Sintaxe de criação com a mesma lógica das variáveis (pode definir o tipo explicitamente ou não)
🔸 Caso for definir o tipo, precisa ser para cada item da tupla (oq talvez não seja tão produtivo), visto que cada item é “único” (a tupla serve simplesmente para armazenar)
🔸 Pode ser inicializado vazia
🔸 Por padrão, cada item da tupla pode ser acessado pelo seu índice, mas é possível atribuir ‘nomes’ para cada item (somente se o tipo não estiver declarado)=> let coords = (lat: 22.1, lng: 27.6)
				</pre>
				<h4>🤠 Array</h4>
				<pre>
🔸 Sintaxe padrão => let numbers = [1,2,3]
🔸 Possuí a sintaxe de criação de uma matriz em Java (utilizando colchetes) e compartilha da característica de conter apenas valores de um MESMO TIPO. Nesse sentido, caso queira definir o tipo de dado da Array durante a criação dela, basta definir somente uma vez, diferentemente da Tupla, que caso for definir o tipo, precisa ser para cada valor contido nela.
🔸 Pode ser inicializado vazia
🔸 Alguns métodos usuais (alguns funcionam para tuplas tbm):
➡ append() -> adiciona na Array
➡ removeAll() -> auto-explicativo
➡ isEmpty -> auto-explicative
➡ count -> verifica tamanho da lista (igual o lenght ou size)
➡ contais() -> verifica na Array se existe o elemento indicado no parâmetro
➡ first -> access o primeiro elemento da Array
➡ insert(‘item’, at: ‘índice’) -> insere um elemento no índice indicado
➡ remove(at: ‘indice’) -> remove o item da Array no índice indicado
➡ removeLast() -> auto-explicativo mas remove o ultimo item da Array
➡ swapAt(0,1) -> meio auto-explicativo mas ele troca os elementos de posição (vc indica quais serão trocados)
				</pre>
				<h4>📒 Dictionary</h4>
				<label>Link:
				<a>https://www.codecademy.com/learn/learn-swift/modules/learn-swift-dictionaries/cheatsheet</a>
				<pre>
🔸 Funciona muito semelhante a uma Array, mas utiliza do conceito de chave-valor (key-value), semelhante a um JSON
🔸 É necessário definir na criação o tipo da chave e do valor
🔸 Possuí métodos da mesma forma que Array, possuindo alguns métodos até idênticos, mas no geral os métodos realmente “são os mesmos” que na Array, mas atualizados para a sintaxe do dictionary.
🔸 Os retornos dos valores sempre são como Opcionais
🔸 Usos gerais:<pre>
◽ Sintaxe de criação:
var products: [tipoChave : tipoValor] = [ : ] —> iniciando vazia<br>
◽ CRUD valores (sempre atento ao tipo da chave e do valor):<br>
🟣CREATE ja na criação do dicionario  —>
var products: [Int : String] = [1 : “Fone de ouvido”]<br>
🟣CREATE/UPDATE normal —>
products[1] = “Fone de ouvido”<br>
🟣MÉTODO CREATE/UPDATE —> 
dictionary.updateValue(valor, forKey: chave) —> add or update a key-value<br>
🔵DELETE meio estranho —> 
products[0] = nil —> nil significa a ausência de valor<br>
🔵 MÉTODO DELETE mais legal —> 
removeValue(forKey: 0) = a partir da chave informada, remove o item<br>
🟡 READ de chave —>
for key in products.key { print(key) }<br>
🟡 READ de valor —>
for val in products.values { print(val) }<br>
🟡 READ key-value —>
for (key, value) in products { print (“chave: \(key), valor: \(valor)” }</pre>
</pre>
			<h4>🙂 Sets</h4>
			<pre>
🔸 Semelhante a um Array, mas não permite itens repetidos
🔸 Igualmente a Array, permite apenas 1 tipo (coleção de dados únicos de mesmo tipo)
🔸 Sintaxe padrao —> var newSet: Set<tipo> = [ ]
🔸 Sua utilização me parece mais específica do que em relação aos demais tipos de dados, além de talvez necessitar de um maior contexto para utilizá-la. Ex:
<pre>
//simulando a Mega-sena<br>
var numbers = 6
var result: Set<Int> = [ ]<br>
while (numbers > 0) {
	//método que gera numeros aleatorios a partir do range definido
	let generated = Int.random (in: 1…60)<br>
	//só irá inserir no Set se o número gerado não for repetido
	let res = result.insert(generated)<br>
	if (res.inserted) {
		numbers--
	}
}</pre></pre>
			<h4>🧶 Laços de Repetição</h4>
			<pre>
🔹While:<pre>
➡ sintaxe padrão, igual em Java e JS (verifica a condição, dps executa o bloco de código)
➡ Repeat/while => igual o do/while (execute o bloco de código, dps verifica a condição)
➡ Sequências (ranges) => controlam o for<br>
ex:
let range = 0…5 // inclusive (incluí tudo)
let r = 0..<5 // exclusive (não incluí o limite)</pre>
🔹 for-in:
<pre>
➡ Sintaxe 1:
◽ for i in x...y { }
◽ i --> variável padrão, é imutável (let)
◽ O for em swift utiliza bem da questão dos parâmetros genéricos, ent a variável 'i'é somente uma opção para tal.<br>
◽ é possível utilizar da cláusula ‘where’ para colocar uma condição no loop. ex:
<pre>
	for i in 1...10 where i % 2 == 0 { print(i) }
</pre>
◽ No geral, o loop for é mais fácil de interpretar traduzindo-o. ex:
<pre>
	let sequencia = 1…5
	for num in sequencia {
		print(num) //exibira todos os itens de ‘sequencia’	
	}
</pre>
-----
➡ Sintaxe 2 (mais padrão):
<pre>
	for item in items {	// Do this	}
</pre>
◽ Nessa sintaxe, deixa mais claro a possibilidade de utilizar do for para iterar uma Array, da mesma forma que um forEach(). A vantagem do for, seria da possibilidade de iterar por uma Array de Array’s, ou seja, cada item da Array a ser iterada é uma outra Array
</pre>
Links:
<a>https://www.programiz.com/swift-programming/for-in-loop</a>
<a>https://www.appypie.com/loops-swift-how-to</a>
<a>https://www.hackingwithswift.com/sixty/4/1/for-loops</a>
</pre>
				<h4>⏸ 'Break' e 'Continue' ▶</h4>
				<pre>
🔸 Break —> utilizado para literalmente quebrar/parar algo, geralmente uma iteração em um loop ou no caso de utilizar de switch/case, por exemplo. Quando utilizado em loops, muito comum ser utilizado dentro de if’s (verificações), para não ser necessário validar tudo de algo (array por ex) quando já satisfez oq era procurado<br>
🔹 Continue —> pula uma iteração e passa para a próxima instrução ou bloco de código.
</pre>
				<h4>👔 Functions</h4>
				<pre>
🔸 Muito semelhante às sintaxe dos métodos em Java e das functions em JavaScript, só muda o prefixo: func nomeFuncao () { }<br>
🔸 Da mesma forma que em Java, os parâmetros precisam de nome + tipo<br>
🔸 Se for utilizar do ‘return’ é necessário definir o tipo do retorno, mesma lógica que em Java, mas o tipo do retorno é definido após os parâmetros, da seguinte forma:
<pre>
func calcMedia (nota1: Double, nota2: Double) -> Double { }
</pre>
🔸 Por padrão, caso for omitido, o return é vazio<br>
🔸 Nos parâmetros, os nomes das ‘variaveis de parâmetro’ funcionam como labels, ou seja, caso não for utilizado um ‘ _ ‘ antes do nome da variavel, na hora de chamar o método e passar os argumentos, seria necessário citar os labels. EX:
<pre>
calcMedia(nota1: 7, nota2: 10)
</pre>
</pre>
				<h4>📜 Closure</h4>
				<a>https://www.programiz.com/swift-programming/closures</a>
				<pre>
🔸 Funciona quase como uma Arroy function em JavaScript, no sentido de que a Closure é uma função resumida. EX:
<pre>
📜 closure:
{ (a: Int, b: Int) -> Int in
   a + b								
}								
</pre>
<pre>
👔 function
func somar (a: Int, b: Int) -> Int {
  	return a + b
}
</pre>
🔸 Características:
- pode ou não receber parâmetros
- não é necessário uma palavra chave para declarar uma closure (como existe nas functions)
- a declaração consiste nas { }
- Sintaxe padrao: { (parametro) -> tipoRetorno in //codigo } 
- o ‘in’ funciona como uma “—>” em JS
- o ’—>’ serve para separar os parâmetros do tipo de retorno 
- Pode ser passada como parâmetro de outras funções (callback function), como em um map por exemplo</pre>
				<h4>❓ Opcionais</h4><pre>
🔸 Uma condição dada aos tipos de varíaveis na qual permite a ausência de valor (nil)
🔸 Resumidademente, permite valores nulos (tipo nulo [nil]) a variáveis , com tipos declarados (String, Int, Double, ...), visto que normalmente isso não seria permitido (ex: atribuir nil a uma variável que espera um valor Int)<br>
🔸 sintaxe -->  <i><b>var variavel: tipoVariavel? , ex: let nota: Int?</b></i><br>
🔸 Como esse tipo de variável permite valores nulos, é necessário fazer algo para que, caso tente acessar um valor nulo, o programa nao dê problema. Para isso, existem 2 respostas padrão:
<pre>
🔹 Definir um valor padrão, caso ainda esteja como nil.Ex:
<pre>var numbers = total ?? 60</pre>Funciona como um if: caso tenha valor, seguirá utilizando o valor normalmente. Caso ainda esteja nil, utiliza o valor padrão<br>
🔹 Forçar um unwrapp na variável
<pre>
▪ usado quando temos certeza de que a variável, mesmo que opcional, terá um valor informado (e não será nil) durante a compilação
▪ utiliza ! ao fim da variável
</pre></pre>
🔸 <b>CUIDADO</b> => caso seja passado um nil e seja usado '!' para forçar, o programa dará fatal error. Para não acontecer este problema, existem maneiras de verificar se realmente é possível forçar um desembrulo da variável:<br>
<b>🌝 if let</b> 
🔹 faz uma verificação if para ver se a variável possuí valor.
🔹 sintaxe --> <pre>
if let product = dict[id] { return product } else { return "nenhum produto encontrado" }</pre>
<b>🌚 guard let</b> 
🔹 muito semelhante ao 'if let' mas realiza as operações em ordem trocada: primeiro verifica o erro, para ent seguir com o sucesso (true)<br>
🔹 sintaxe --><pre> 
guard let product = dict[id] else { return "nenhum produto encontrado" } return product</pre>
🔹 QUANDO USAR --> semelhante ao NOT NULL em SQL, ou seja, geralmente utilizado após verificar se é necessário ou não existir um valor. In fact, esse é um dos motivos para existir esse tipo, visto que serve para tratar, por exemplo, valores nulos vindo de um BD, visto que no BD podem existir campos que permitem serem nulos, fazendo com que em nosso sistema realizassemos a mesma lógica, definindo algumas variáveis como <i>opcionais</i>.<br>
É possível definir mais condições ao utilizar o if let e guard let, utilizando ' , ' EX:<pre>
	if let user = loadUsername(), let password = decryptPassword() {
    	authenticate(user, password)
	}</pre></pre>
				<h4>📖 Enum</h4>
				<label>Link:
				<a>https://www.youtube.com/watch?v=pgHzqTXwkLI&t=6s</a>
				<pre>
🔸 Basicamente é uma lista de itens. Contudo, cada item é um 'case' (o mesmo utilizado em swift), logo, podem ser atribuídos códigos para cada case utilizando um switch (fora da estrutura do enum)<br>
🔸 O tipo do enum não precisa necessariamente ser especificado, além dele poder armazenar valores de qualquer tipo e os tipos destes valores poderem ser diferentes para cada membro do enum (logo, deve-se avaliar se vale a pena limitar o tipo do enum ou de seus case's)<br>
🔹 Life hack: se definir a enum para Int e nos cases não definirmos uma sequencia, os valores serão auto-incrementais. Ex:<pre>
enum Dia: Int { case Domingo = 1, Segunda, Terça, .... } Dia.Segunda.rawValue //2</pre>
🔸 <i>Raw Value</i> => 'método' para pegar o valor do case
🔸 Ao inves do rawValue, pode ser mais adequado utilizar um switch self
🔸 Motivos para utilizar;
◽ Reduzir linhas de códigos ao simplesmente pegar o case e seu rawValue
◽ Definir nomes para variáveis que serão utilizadas várias vezes (agilizando seus acessos), e que possuem valores padrões<br>
🔸 É do tipo 'Reference Type', assim como as 'Class'</pre>
				<h4>🏡Struct</h4>
				<pre>
🔸 Muito semelhante ao conceito de classes de Java e JS, mas é mais simples, visto que o Struct não permite herança, além de existir um 'class' em Swift, ent deve-se tomar cuidado para não misturar os conceitos<br>
🔸 Outra diferença para as classes, é que o Struct trabalha com o tipo VALOR. Nesse sentido, é possível criar apenas uma instância de objeto e dps criar novas variáveis e atribuir o VALOR sendo o primeiro objeto instanciado.<br>
🔸 Em resumo, os objetos do tipo Struct, não são necessariamente únicos, pois podem ser feitas CÓPIAS de um único objeto criado<br>
🔸 Logo, é do tipo 'Value Type', assim como Arrays, Dictionarys, Tuplas<br>
🔹 sintaxe<pre>let player1 = Player()</pre></pre>
				<h4>👑 Class</h4>
				<pre>
🔸 De forma geral, são os mesmos conceitos, técnicas e lógicas de classes das vistas em Java.<br>
🔸 Trabalham com REFERÊNCIA, ou seja, cada instância será um local da memória diferente, portanto deve-se atentar ao modo de como será instanciado um objeto (visto que pode ser feita REFERÊNCIA ao mesmo local de memória). De modo geral, o processo é o seguinte: <pre>
	1. instânciar um objeto (ex: let jogador1 = Jogador())
	2. caso eu queira instanciar um novo objeto da class Jogador, eu devo instanciar novamente um novo objeto, e não tentar fazer o seguinte:<br>
	let jogador2 = jogador1</pre>Nesse caso, tanto jogador1 quanto jogador2 estao fazendo REFERÊNCIA ao mesmo espaço de memória e, portanto, ao mesmo objeto. Logo, qualquer alteração das propriedades desse objeto serão observadas em ambas as variáveis<br>
🔹 sintaxe --> var pessoa : Pessoa = Pessoa()
				</pre>
				<h4>😲Semelhanças e Diferenças entre 'Class' e 'Struct'</h4>
				<label>Link:
				<a>https://www.youtube.com/watch?v=tKSNjg9Cb_g&list=PLZPWdr0WUuJ93mjCDaxLM8ZOi_5BwG7iC&index=6</a>
				<pre>
🔸 Tanto em Struct quanto em Class, deve-se atentar a alguns casos:<pre>
🔹 Caso nao definir um valor inicial para um atributo, deve ser criado um metodo inicializador (construtor)<br>
🔹 Nao pode criar um metodo construtor vazio -> visto que esse conceito acontece quando definimos valores iniciais aos atributos, permitindo que instanciemos um objeto sem ter que definir seus atributos logo de cara<br>
🔹 Se nao quiser criar um metodo construtor, deve-se definir um valor inicial para cada atributo (geralmente é tipo "", 0, ...)</pre>
🔸 Método Inicializador (mesmo conceito do método construtor de Java)<pre>
init (parameters) {
	statements	
}</pre></pre>
				<h4>🔐 Encapsulamento</h4>
				<pre>
🔸 Mesmo conceito de Java, ent serve pra definir os tipos de acesso às classes, propriedades e métodos<br>
Tipos:
🔸 <b>public</b> – Permite acesso a qualquer outro elemento.
🔸 <b>internal</b> – Permite acesso apenas dentro da própria classe e nas classes herdeiras.
🔸 <b>private</b> – Permite acesso apenas dentro da classe na qual foi declarada.<br>
OBS:
🔸 por padrão, o nível de encapsulamento é <i><b>'internal'</b></i>.
🔸 o encapsulamento do Swift funciona apenas se a classe e sua instância estiverem em arquivos separados.</pre>
				<h4>🧐'willSet' e 'didSet'</h4>
				<label>Link:
				<a>https://www.codingem.com/didset-and-willset-in-swift/</a>
				<pre>
🔸 Os observadores 'didSet' e 'willSet' provêm uma maneira de responder corretamente quando uma propriedade tem seu valor definido/alterado. 
🔸 O observador willSet é chamado antes de o valor ser atribuído a uma propriedade
🔸 O observador didSet é chamado depois de uma propriedade ter recebido um valor.
<pre>
🔹 willSet runs a piece of code right before a property changes.
🔹 didSet runs a piece of code right after the property has changed.<br>
var name: String = "Alice" {
    willSet { print("Name will from \(name) to \(newValue)") }
    didSet { print("Name changed from \(oldValue) to \(name)")}
}
name = "Jack"
-------------------------
Output:<br>
Name will from Alice to Jack
Name changed from Alice to Jack</pre><pre>Property observers also take parameters that refer to the old and the new values.<br>
By default, these parameters are called oldValue and newValue.
🔹 The willSet block always stores the incoming value as newValue.
🔹 The didSet block always stores the previous value as oldValue.<br>
To access these parameters, you do not need to declare them anywhere. They are automatically in your use.</pre></pre>
				<h4>🌳 Herança</h4>
				<pre>
🔸 Mesmo princípio das outras linguagens, portanto permite o compartilhamento (herança/herdar) os métodos e atributos entre classes<br>
🔸 sintaxe <pre>classeFilha : classePai</pre>
🔸 É como se vc estivesse atribuindo a uma classeFilha ser do tipo da classePai<br>
❗ <i>IMPORTANTE:</i> A subclasse pode ter suas próprias propriedades e métodos, e estes não podem ser acessados pela superclasse, já que o fluxo da herança é sempre da superclasse para a subclasse</pre>
				<h4>🧬Polimorsfismo</h4>
<pre>
🔸 Novamente, funciona a partir do mesmo princípio das outras linguagens, então é a propriedade que permite a subClasse (classeFilha) sobrescrever métodos e propriedades de uma superClasse (classePai)<br>
🔸 Tanto em Swift quanto em Java utiliza-se da mesma palavra reservada: <i><b>override</b></i><br>
🔸 Novamente igual em Java, em Swift existe a palavra reservada <i><b>final</b></i> para definir como "final"/irretocável um atributo ou método
				</pre>
				<h4>🔖Protocol</h4>
				<label>Link:
				<a>https://www.programiz.com/swift-programming/protocols#:~:text=In%20Swift%2C%20a%20protocol%20defines,(or%20any%20other%20types)</a>
				<pre>
🔸 Funciona como uma class abstract em Java, ou seja, sua função é ser um modelo para que outras classes utilizem de seus métodos e atributos, mudando apenas o conteúdo deles<br>
🔸 A diferença aqui é que o 'protocol' tem sintaxe semelhante a uma function, na qual dentro dele irão os atributos ou functions para serem usados em outros locais<br>
🔸 sintaxe e ex:<pre><b style='color:cyan'>protocol Greet {
// blueprint of a property
var name: String { get }<br>
// blueprint of a method 
func message()<br> 
}</b><br>
------------<br>
<b style='color:lightGreen'>// conform class to Greet protocol
class Employee: Greet {<br>
	// implementation of property
	var name = "Perry"<br>
	// implementation of method
	func message() {
	print("Good Morning!")
	}
}</b></pre></pre>
				<h4>⚙ Delegate</h4>
				<label>Links:<br>
				<li><a>https://jamesrochabrun.medium.com/implementing-delegates-in-swift-step-by-stepd3211cbac3ef#:~:text=Delegates%20are%20a%20design%20pattern,B%20to%20perform%20an%20action.</a></li>
				<li><a>https://medium.com/mackmobile/protocol-delegate-em-swift-5f521e19ca56</a></li><br>
				<pre>
🔸Delegates are a design pattern that allows one object to send messages to another object when a specific event happens.<br>
🔸Imagine an object A calls an object B to perform an action. Once the action is complete, object A should know that B has completed the task and take necessary action, this can be achieved with the help of delegates!</pre>
			</details>
		</div>
	</details>
</div>