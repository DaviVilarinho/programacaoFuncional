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
valida (d,m,y) = let dias = diasMes m
                     fevereiroDias = fevereiro $ bissexto y
                     in
    if (m == 2 && d > fevereiroDias) then False else
    if (d > dias) then False else
    True

-- -- b
bissextos :: [Int] -> [Int]
bissextos n = let nBissextos = [x | x <- n, bissexto x] in
    nBissextos

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
emDia (_,_,_,dev,sit) date = let dataPrecede = dev `precede` date in
    if (dataPrecede && sit == "aberto") then False else
    True

atrasados :: [Emprestimo] -> Data -> [Emprestimo]
atrasados emprestimos theData = let listaAtrasados = [x | x <- emprestimos, emDia x theData == False] in listaAtrasados

-- -- d
fibo2 :: Int -> Int
fibo2 0 = 0
fibo2 n = let parN = passo (0,1) n 0 in fst parN

passo :: (Int, Int) -> Int -> Int -> (Int, Int)
passo (x, y) n acc = let nextFib = y+x
                         accAcc = acc+1 in
    if (n == acc) then (x,y) else passo (y,nextFib) n (accAcc)

-- -- e
prodIntervalo :: Int -> Int -> Int
prodIntervalo m n = let produtoDoResto = prodIntervalo (m+1) n in
    if (m == n) then n else
    m * produtoDoResto

fatorial :: Int -> Int
fatorial n = let produto = prodIntervalo 1 n in produto

