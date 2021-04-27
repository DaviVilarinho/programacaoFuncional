figura :: Double -> Double -> Double -> String
-- 60 60 60
figura a b c
    | a == b && a == c = "equilatero"
    | (a == 90) || (b == 90) || (c == 90) = "retangulo"
    | (a > 90) || (b > 90) || (c > 90) = "obtuso"
    | otherwise = "simples"
