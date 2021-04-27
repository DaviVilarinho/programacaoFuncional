-- 1
-- -- a
type Data = (Int, Int, Int)

bissexto :: Int -> Bool
bissexto ano
    | ano `mod` 400 == 0 = True
    | ano `mod` 4   == 0 && (ano `mod` 100 /= 0) = True
    | otherwise = False

fevereiro :: Bool -> Int
fevereiro isBissexto 
    | isBissexto = 29
    | otherwise  = 28

diasMes mes
    | mes `mod` 2 == 0 && mes <= 7 = 30
    | mes `mod` 2 /= 0 && mes <= 7 = 31
    | mes `mod` 2 == 0 = 31
    | mes `mod` 2 /= 0 = 30

valida :: Data -> Bool
valida (d,m,y)
    | m == 2 && d > fevereiroDias = False
    | d > dias = False
    | otherwise = True
    where dias = diasMes m
          fevereiroDias = fevereiro (bissexto y)

-- -- b
bissextos :: [Int] -> [Int]
bissextos n = nBissextos
    where nBissextos = [x | x <- n, bissexto x]

-- -- c
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
    | dataPrecede && sit == "aberto" = False
    | otherwise = True
    where dataPrecede = dev `precede` date

atrasados :: [Emprestimo] -> Data -> [Emprestimo]
atrasados emprestimos theData = listaAtrasados
    where listaAtrasados = [x | x <- emprestimos, emDia x theData == False]

-- -- d
fibo2 :: Int -> Int
fibo2 0 = 0
fibo2 n = fst parN
    where parN = passo (0,1) n 0

passo :: (Int, Int) -> Int -> Int -> (Int, Int)
passo (x, y) n acc
    | n == acc  = (x, y)
    | otherwise = passo (y,nextFib) n (accAcc)
    where nextFib = y+x
          accAcc = acc+1

-- -- e
prodIntervalo :: Int -> Int -> Int
prodIntervalo m n 
    | m == n = n 
    | otherwise = m * produtoDoResto
    where produtoDoResto = prodIntervalo (m+1) n

fatorial :: Int -> Int
fatorial n = produto
    where produto = prodIntervalo 1 n 

