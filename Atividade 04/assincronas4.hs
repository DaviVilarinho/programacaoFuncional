-- 2
a = [5,4..1]
b = ['a', 'c'..'e']
c = [1,4..16] 
d = zip [1,-2.. -11] [1,5..17]

-- 3
---- a

intervalo3a :: Int -> Int -> [Int]
intervalo3a a b
    | a >= b = []
    | otherwise = [a..b]

---- b
intervalo3b :: Int -> Int -> [Int]
intervalo3b a b
    | a >= b = []
    | otherwise = [(a+1), a+3..(b-1)]

-- 5
quadrados :: Int -> Int -> [Int]
quadrados a b = [x^2 | x <- [a..b]]

-- 6
seleciona_impares :: [Int] -> [Int]
seleciona_impares listacompleta = [ x | x <- listacompleta, x `mod` 2 == 1 ]

-- 7
tabuada :: Int -> [Int]
tabuada i = [ x*i | x <- [1..10]]

-- 8
bissexto :: Int -> Bool
bissexto ano
    | ano `mod` 400 == 0 = True
    | ano `mod` 4   == 0 && (ano `mod` 100 /= 0) = True
    | otherwise = False

bissextos :: [Int] -> [Int]
bissextos lista = [ x | x <- lista, bissexto x ]

-- 9
sublistas :: [[Int]] -> [Int]
sublistas a = [ x | x <- foldr (++) [] a ] 

--------------------------------------------------------------
-- 10
type Data = (Int, Int, Int)
type Emprestimo = (String, String, Data, Data, String)
precede :: Data -> Data -> Bool
precede (d1,m1,y1) (d2,m2,y2)
    | y1 > y2 = False
    | y1 < y2 = True
    | m1 > m2 = False
    | m1 < m2 = True
    | d1 >= d2 = False
    | otherwise = True

emDia :: Emprestimo -> Data -> Bool
emDia (_,_,_,dev,sit) date
    | dev `precede` date && sit == "aberto" = False
    | otherwise = True

atrasados :: [Emprestimo] -> Data -> [Emprestimo]
atrasados emprestimos theData = [x | x <- emprestimos, emDia x theData == False]

--------------------------------------------------------------
-- 11
uniaoNRec :: Eq a => [a] -> [a] -> [a]
uniaoNRec a b = [x | x <- a ++ [bs | bs <- b, bs `notElem` a]]
