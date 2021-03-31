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

-- 4

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
