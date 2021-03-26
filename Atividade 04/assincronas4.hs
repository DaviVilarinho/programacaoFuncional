-- 2
a = [5,4..1]
b = ['a', 'c'..'e']
c = [1,4..16] 
d = zip [1,-2.. -11] [1,5..17]

-- 3
---- a

intervalo :: Int -> Int -> [Int]
intervalo a b
    | a >= b = []
    | otherwise = [a..b]

---- b
intervalo :: Int -> Int -> [Int]
intervalo a b
    | a >= b = []
    | otherwise = [a, a+2..b]
