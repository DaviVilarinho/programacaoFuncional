-- questão 1

dobro :: Double -> Double
dobro a = 2*a

quadruplicar :: Double -> Double
quadruplicar a = dobro(dobro(a))

hipotenusa :: Double -> Double -> Double
hipotenusa b c = sqrt(b^2 + c^2)

distancia :: (Double, Double) -> (Double, Double) -> Double
distancia a b = sqrt((fst a - fst b)^2 + (snd a - snd b)^2)

-- questão 3

converter :: Double -> (Double, Double, Double)
converter reais = (reais, reais*3.96, reais*4.45) 

-- questão 4
--
bissexto :: Int -> Bool
bissexto ano
    | ano `mod` 400 == 0 = True
    | ano `mod` 4   == 0 && (ano `mod` 100 /= 0) = True
    | otherwise = False

-- questão 5
--
type Data = (Int, Int, Int)
getYear (_,_,yy) = yy
bissexto2 :: Data -> Bool
bissexto2 date
    | getYear date `mod` 400 == 0 = True
    | getYear date `mod` 4   == 0 && (getYear date `mod` 100 /= 0) = True
    | otherwise = False

-- questão 6
--
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
    | m == 2 && d > fevereiro (bissexto y) = False
    | d > diasMes m = False
    | otherwise = True

-- questão 7
--
precede :: Data -> Data -> Bool
precede (d1,m1,y1) (d2,m2,y2)
    | (valida (d1,m1,y1) && valida(d2,m2,y2)) /= True = False
    | y1 > y2 = False
    | y1 < y2 = True
    | m1 > m2 = False
    | m1 < m2 = True
    | d1 >= d2 = False
    | otherwise = True

-- questão 8
--
type Livro = (String,String,String,String,Int)
type Aluno = (String,String,String,String)
type Emprestimo = (String,String,Data,Data,String)

-- questão 9
--
emDia :: Emprestimo -> Data -> Bool
emDia (_,_,_,dev,sit) date
    | dev `precede` date && sit == "aberto" = False
    | otherwise = True
