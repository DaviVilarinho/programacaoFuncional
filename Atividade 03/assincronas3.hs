
-- 1
-- -- a
-- -- -- 1
oua1 :: Bool -> Bool -> Bool
oua1 False False = False
oua1 _ _ = True

-- -- -- 2
oua2 :: Bool -> Bool -> Bool
oua2 True _ = True
oua2 _ True = True
oua2 False False = False

-- -- -- 3
oua3 :: Bool -> Bool -> Bool
oua3 True  True  = True
oua3 False True  = True
oua3 True  False = True
oua3 False False = False

-- -- b
-- -- -- 1
oub1 :: Bool -> Bool -> Bool
oub1 x y
    | x == False && y == False = False
    | otherwise = True

-- -- -- 2
oub2 :: Bool -> Bool -> Bool
oub2 x y
    | x == True && y == True = True
    | x == True && y == False = True
    | x == False && y == True = True
    | x == False && y == False = False

---------------------------------------------------
-- 2
dist :: (Float, Float) -> (Float, Float) -> Float
dist (x1,y1) (x2,y2) = sqrt((x1-x2)^2 + (y1-y2)^2)

---------------------------------------------------
-- 3
-- -- guardas
fatorialG :: Int -> Int
fatorialG x
    | x == 0    = 1
    | otherwise = x * fatorialG (x-1) 

-- -- casamento de padrões
fatorialC :: Int -> Int
fatorialC 0 = 1
fatorialC x = x * fatorialC (x-1)

---------------------------------------------------
-- 4
fibo :: Int -> Int
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-2) + fibo (n-1) 

---------------------------------------------------
-- 5
n_tri :: Int -> Int
n_tri 0 = 0
n_tri n
    | n `mod` 2 == 0 = (n+1)*(n `div` 2) 
    | otherwise      = n * ((n `div` 2) + 1)

---------------------------------------------------
-- 6
potencia2 :: Int -> Int
potencia2 0 = 1
potencia2 n = 2 * potencia2 (n-1)

---------------------------------------------------
-- 7
-- -- a
prodIntervalo :: Int -> Int -> Int
prodIntervalo m n 
    | m == n = n 
    | otherwise = m * prodIntervalo (m + 1) n 

-- -- b
fatorial :: Int -> Int
fatorial n = prodIntervalo 1 n 

---------------------------------------------------
-- 8
resto_div :: Int -> Int -> Int
resto_div m n
    | m < n     = m
    | otherwise = resto_div (m-n) n

div_inteira :: Int -> Int -> Int
div_inteira 0 n = 0
div_inteira m n 
    | m < n = 0
    | otherwise = 1 + div_inteira (m - n) n


---------------------------------------------------
-- 9
mdcg :: Int -> Int -> Int
mdcg m n
    | n == 0 = m
    | otherwise = mdcg n (m `mod` n)

mdcc :: Int -> Int -> Int
mdcc m 0 = m
mdcc m n = mdcc n (m `mod` n)

---------------------------------------------------
-- 10

binomialg :: Int -> Int -> Int
binomialg n k
    | k == 0 = 1
    | k == n = 1
    | otherwise = binomialg (n-1) k + binomialg (n-1) (k-1)

binomialc :: Int -> Int -> Int
binomialc n 0 = 1
binomialc n k = if n == k then 1
                else (binomialc (n-1) k) + (binomialc (n-1) (k-1))

---------------------------------------------------
-- 11
fibo2 :: Int -> Int
fibo2 0 = 0
fibo2 n = fst $ passo (0,1) n 0

passo :: (Int, Int) -> Int -> Int -> (Int, Int)
passo (x, y) n acc 
    | n == acc  = (x, y)
    | otherwise = passo (y,y+x) n (acc+1)
