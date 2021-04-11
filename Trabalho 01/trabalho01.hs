-- 1
analisa_raizes :: Double -> Double -> Double -> Int
---- 1: duas raízes
---- 2: Uma raiz
---- 3: Não possui
---- 4: Degenerada
analisa_raizes a b c
    | a     == 0 = 4
    | delta  > 0 = 1
    | delta == 0 = 2
    | otherwise  = 3
    where delta = b^2 - 4 * a * c

-- 2
equacao :: Double -> Double -> Double -> (Double, Double)
equacao a b c
    | analisa_raizes a b c == 4 = (a, (-1*c)/b)
    | otherwise           = ((-b + sqrt(delta))/(2*a),
                             (-b - sqrt(delta))/(2*a))
    where delta     = b^2 - 4 * a * c

-- 3
-- -- 3) Considere que o preço de uma passagem de  ônibusintermunicipal  pode variardependendo da idade do passageiro. Crianças até 10 anos pagam 40% e bebês (abaixode 2 anos) pagam apenas 15%. Pessoas com 70 anos ou mais pagam apenas 50% dopreço total. Os demais passageiros, pagam a tarifa normal (100%). Faça uma função quetenha como entrada: o valor total da passagem, a data atual e a data de nascimento dopassageiro. Como saída, a função retorna o valor a ser pago. (Obs.: na solução, deve serdefinido o tipo data para representar a tupla (d,m,a)).

-- -- 30 07 2020 29 08 2019
type Data = (Int,Int,Int)
idade :: Data -> Data -> Int
idade (a,b,c) (x,y,z)
    | z == c = 0
    | c > z && b > y = c - z
    | c > z && b < y = c - z - 1
    | otherwise      = if x <= a then c - z else c-z-1
 

precoPassagem :: Float -> Data -> Data -> Float
precoPassagem pTot dataHj dataNascimento
    | idade dataHj dataNascimento < 2   = 0.15*pTot
    | idade dataHj dataNascimento >= 70 = 0.50*pTot
    | otherwise                         = pTot

-- 4
gera1 :: [Int]
gera1 = [ x^3 | x <- [3..11], x `mod` 2 == 0]

gera2 :: [(Int,Int)]
gera2 = [ (x,y) | x <- [0..5], y <- [(x+1)..(3*x-1)]]

gera3 :: [Int]
gera3 = let l1 = [15,16] in geraListaAte l1
geraListaAte :: [Int] -> [Int]
geraListaAte []     = []
geraListaAte (x:xs) = [1..x]++geraListaAte xs

gera4 :: [(Int,Int)]
gera4 = [ (x,x+1) | x <- [1..10-1], x `mod` 2 == 0]

gera5 :: [Int]
gera5 = map (sumTuple) gera4
sumTuple :: (Int,Int) -> Int
sumTuple (x,y) = x+y

-- 5
pos_multiplos_3 :: [Int] -> [Int]
pos_multiplos_3 l = [ x | x <- l, x `mod` 3 == 0, x > 0 ]

-- 6
fatores :: Int -> [Int]
fatores n = [ x | x <- [1..n], n `mod` x == 0 ]
primosEntre :: Int -> Int -> [Int]
primosEntre min max = [ x | x <- [min..max], fatores x == [1,x] ] 

-- 7

mmc :: Int -> Int -> Int -> Int
mmc x y z = mmcLista (x:y:z:[])

mmcLista :: [Int] -> Int
mmcLista [] = 1
mmcLista l
    | 1 `elem` l = mmcLista ([x | x <- l, x /= 1])
    | otherwise  = menorFator*(mmcLista divididos)
    where 
        menorFator = minimum [a | a <- todosFatores l, a /= 1]
        divididos = map (\x -> if x `mod` menorFator == 0 then x `div` menorFator else x) l

todosFatores :: [Int] -> [Int]
todosFatores [] = []
todosFatores (x:xs) = (fatores x)++(todosFatores xs)
                      
-- 8                  
calcula_serie :: Double -> Int -> Double
calcula_serie x 0 = 0
calcula_serie x n
    | n `mod` 2 == 0    = x/(fromIntegral n) + calcula_serie x (n-1)
    | otherwise         = (fromIntegral n)/x + calcula_serie x (n-1) 

-- 9
fizzBuzzIs x
    | x `mod` 2 == 0 &&  x `mod` 3 == 0 = "FizzBuzz"
    | x `mod` 2 == 0 = "Fizz"
    | x `mod` 3 == 0 = "Buzz"
    | otherwise = "No"

fizzbuzz :: Int -> [String]
fizzbuzz n = map fizzBuzzIs [1..n]

-- 10
sel_multiplos :: Int -> [Int] -> [Int]
sel_multiplos n l = [ x | x <- l, x `mod` n == 0 ]

-- 11
unica_ocorrencia :: Eq a => a -> [a] -> Bool
unica_ocorrencia e [] = False
unica_ocorrencia e (x:xs)
    | x == e    = True
    | otherwise = unica_ocorrencia e xs 

-- 12
intercala :: [a] -> [a] -> [a]
intercala (x:xs) []     = x:xs
intercala [] (y:ys)     = y:ys
intercala (x:xs) (y:ys) = x:y:(intercala xs ys)

-- 13
zipar :: [a] -> [a] -> [[a]]
zipar   _      [] = [] 
zipar   []      _ = []
zipar (x:xs) (y:ys) = [x,y]:(zipar xs ys)

-- 14
-- -- 14) Defina novos tipos para representar os dados contidos numa agenda pessoal. Para cada contato, armazene as informações: nome, endereço, telefone, e-mail. Em seguida, crie uma função para recuperar o nome de um contato, a partir do email. Caso o número não seja encontrado, retornar a mensagem “Email desconhecido”.
--
---------------- nome - ender - email -- fone -
type Contact = (String, String, String, String)

getMail :: Contact -> String
getMail (_,_,x,_) = x

getNameByMail :: String -> [Contact] -> String
getNameByMail mail [] = "Email desconhecido"
getNameByMail mail ((n,_,m,_):cs)
    | mail == m = n 
    | otherwise = getNameByMail mail cs

-- 15
type Pessoa = (String, Float, Int, Char)
pessoas :: [Pessoa]
pessoas = [ ("Rosa", 1.66, 27,'F'),
            ("João", 1.85, 26, 'C'),
            ("Maria", 1.55, 62, 'S'),
            ("Jose", 1.78, 42, 'C'),
            ("Paulo", 1.93, 25, 'S'),
            ("Clara", 1.70, 33, 'C'),
            ("Bob", 1.45, 21, 'C'),
            ("Rosana", 1.58,39, 'S'),
            ("Daniel", 1.74, 72, 'S'),
            ("Jocileide", 1.69, 18, 'S') ]

-- auxiliar
getAltura :: Pessoa -> Float
getAltura (_,a,_,_) = a

alturaMedia :: [Pessoa] -> Float
alturaMedia ps = (sum (map (getAltura) ps))/(fromIntegral (length ps))

-- auxiliar
getIdade :: Pessoa -> Int
getIdade (_,_,i,_) = i
menor :: Ord a => [a] -> a
menor [x] = x
menor (x:xs:xss)
    | x < xs = menor (x:xss)
    | otherwise = menor (xs:xss)

idadeMaisNova :: [Pessoa] -> Int
idadeMaisNova ps = menor [ getIdade x | x <- ps ]

nomeEstadoMaisVelha :: [Pessoa] -> (String,Char)
nomeEstadoMaisVelha [(n,a,i,e)] = (n,e)
nomeEstadoMaisVelha ((n,a,i,e):(ns,as,is,es):pss)
    | i > is = nomeEstadoMaisVelha ((n,a,i,e):pss)
    | otherwise = nomeEstadoMaisVelha ((ns,as,is,es):pss)

maisQ50 :: [Pessoa] -> [Pessoa]
maisQ50 ps = [c | c <- ps, getIdade c >= 50]

--auxiliar 
getEstado :: Pessoa -> Char
getEstado (_,_,_,c) = c

casadosMaisQue :: Int -> [Pessoa] -> Int
casadosMaisQue i ps = length [c | c <- ps, getIdade c >= i, getEstado c == 'C']
-- 16
-- Escreva a função  insere_ord   a   seguir, que recebe uma lista polimórficaordenada de elementos (critério de ordenação crescente) e um novo elemento  x (domesmo tipo da lista) e retorna a nova lista com o novo elemento inserido
insere_ord :: Ord a => a -> [a] -> [a]
insere_ord ins [] = [ins]
insere_ord ins [x] = if ins > x then [x]++[ins] else ins:[x] 
insere_ord ins (x:xs:xss)
    | ins < x = ins:x:xs:xss 
    | ins >= x && ins <= xs = x:ins:xs:xss
    | otherwise = x:(insere_ord ins (xs:xss))
-- 17
-- Escreva a função revertea seguir que recebe uma lista polimórfica e retorna umalista com seus elementos ao contrário.
reverte :: [a] -> [a]
reverte [] = []
reverte (x:xs) = (reverte xs)++[x]
-- 18
-- Escreva a função  elimina_repeta seguir que recebe uma lista polimórfica eretorna uma lista sem elementos repetidos.
--
eliminaRepet :: Eq a => [a] -> [a]
eliminaRepet [] = []
eliminaRepet list
    | x `elem` xs = eliminaRepet xs
    | otherwise   = (eliminaRepet xs)++[x]
    where x = last list
          xs = init list 
-- 19
-- notasTroco 1 = [1]
disponiveis = [1,2,5,10,20,50,100]

notasTroco :: Int -> [[Int]]
notasTroco 0 = [[]]
notasTroco n = [x:t | x <- disponiveis, x <= n, t <- (notasTroco (n-x))]
-- notasTroco 
-- 20
-- -- nrainhas
-- -- -- fazer como o notas troco

nrainhas :: Int -> [[Int]]
nrainhas 1 = [[]]
nrainhas n = 

