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

-- 7

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
