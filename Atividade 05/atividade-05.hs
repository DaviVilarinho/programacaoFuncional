-- 1
-- -- Implemente   as   funções   recursivas   vistas   nas   vídeo-aulas   9   e   10:   conta_ch,conta, maior, primeiros, pertence, uniaoR.
conta_ch :: [Char] -> Int
conta_ch []     = 0
conta_ch (x:xs) = 1 + conta_ch xs

conta :: [a] -> Int
conta []     = 0
conta (x:xs) = 1 + conta xs

maior :: Ord a => [a] -> a
maior [a] = a
maior (x:xs:xss)
    | x > xs    = maior $ [x]++xss 
    | otherwise = maior $ [xs]++xss

primeiros :: Int -> [a] -> [a]
primeiros 0 _  = []
primeiros _ [] = []
primeiros n (x:xs) = x:(primeiros (n-1) xs)

pertence :: Eq a => a -> [a] -> Bool
pertence a [] = False
pertence a (x:xs)
    | a == x      = True
    | otherwise   = pertence a xs

uniaoR :: Eq a => [a] -> [a] -> [a]
uniaoR [] y = y
uniaoR (x:xs) y
    | x `pertence` y = uniaoR xs y
    | otherwise      = x:uniaoR xs y


-- 2
-- -- Escreva a função recursiva npares que recebe uma lista de inteiros e retorna aquantidade de números pares pertencentes à lista.
npares :: [Int] -> Int
npares [] = 0
npares (x:xs)
    | x `mod` 2 == 0 = 1 + npares xs
    | otherwise = npares xs

-- 3
-- -- Escreva   a   função   recursiva   produtorio   que   recebe   uma   lista   de   números   eretorna o produto de todos os seus elementos.
produtorio :: Num a => [a] -> a
produtorio [] = 1
produtorio (x:xs) = x * (produtorio xs)

-- 4
-- -- Escreva a função recursiva comprime a seguir que recebe uma lista de listas eretorna uma lista contendo todos os elementos das sublistas.
comprime :: [[a]] -> [a]
comprime [] = []
comprime (x:xs) = x++(comprime xs)

-- 5
-- -- Escreva a função recursiva tamanho a seguir que recebe uma lista polimórfica(de qualquer tipo) e retorna a quantidade de elementos que ela possui.
tamanho :: [a] -> Int
tamanho []     = 0
tamanho (x:xs) = 1 + tamanho xs

-- 6
-- -- Escreva a função recursiva uniaoRec2 que faz a união de duas listas de modoque   mantenha   todos   os   elementos   da   1a   lista   na   mesma   ordem   e   no   finalacrescenta  os elementos da 2a lista que não estejam presentes na primeira

uniaoRec2 :: Eq a => [a] -> [a] -> [a]
uniaoRec2 w [] = w
uniaoRec2 w (x:xs)
    | x `elem` w = (uniaoRec2 w xs)
    | otherwise  = (uniaoRec2 (w++[x]) xs)
