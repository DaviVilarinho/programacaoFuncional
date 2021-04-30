-- 1) Usando a função map, escreva a função paridade a seguir que recebe uma lista de inteiros l e retorna uma lista contendo os valores booleanos que indicam a paridade dos elementos de l.

paridade :: [Int] -> [Bool]
paridade li = map (\x -> x `mod` 2 == 0) li

-- 2) Usando a função map, escreva a função prefixos a seguir que recebe uma lista de strings l e retorna uma lista contendo os três primeiros caracteres de cada elemento de l.

prefixos :: [String] -> [String]
prefixos l = map (\x -> take 3 x) l

-- 3) Usando a função map, escreva a função saudacao a seguir que recebe uma lista de nomes (strings) l e retorna uma lista contendo cada elemento de l concatenado com a saudação “Oi “ na frente de cada nome

saudacao :: [String] -> [String]
saudacao l = map (\x -> "Oi " ++ x) l

-- 4) Reescreva a definição da função filter que já faz parte da biblioteca padrão do Haskell, chamando-a de filtrar. Além disso, defina a função filtrar usando lista por compreensão.

filtrar fun l = map fun l

filtrar' :: (a -> Bool) -> [a] -> [a]
filtrar' fun l = [ x | x <- l, fun x ]

-- 5) Usando a função filter, escreva a função pares que recebe uma lista de inteiros lst e e retorna uma lista contendo os elementos pares de lst.
pares :: [Int] -> [Int]
pares lst = filter (\x -> x `mod` 2 == 0) lst

-- 6) Usando a função filter, escreva a função solucoes a seguir que recebe uma lista de inteiros l e retorna uma lista contendo os valores que satisfazem a equação (5*x + 6) < (x*x). Use uma expressão lambda (função anônima) para representar a função que realiza o teste do filtro.
solucoes :: [Int] -> [Int]
solucoes l = filter (\x -> 5*x + 6 < x*x) l

-- 7) Usando a função foldr1, escreva a função maior a seguir que recebe uma lista e retorna seu maior elemento
maior :: Ord a => [a] -> a
maior l = foldr1 (\x y -> if x > y then x else y) l

-- 8) Usando a função foldr, escreva a função menor_min10 a seguir que recebe uma lista e retorna o menor elemento da lista, desde que este não acima de 10, Se o menor elemento for um valor acima de 10, retorna 10.

menor_min10 :: [Int] -> Int
menor_min10 l = foldr (\x y -> if x <  y then x else y) 10 l

-- 9) Usando a função foldr, escreva a função junta_silabasplural a seguir que recebe uma lista de sílabas (strings) e retorna uma palavra (string) formada pela concatenação das sílabas e incluindo um “s” no final .

junta_silabasplural :: [String] -> String
junta_silabasplural l = (foldr (\x y -> x++y) "" l) ++ "s"

-- 10)Implemente a função menores10 que recebe uma lista de inteiros e retorna duas informações: uma nova lista com todos os elementos menores que 10 da lista de entrada e quantos elementos são menores que 10. Essas informações devem ser retornadas em uma tupla. Ex:

menores_10 :: [Int] -> ([Int], Int)
menores_10 li = (menores, length menores)
                where menores = [x | x <- li, x < 10]

-- 11) Implemente a função busca, que verifica se um dado elemento está presente em uma lista de entrada. A função retorna se o elemento está ou não presente na lista (True ou False) e o número de comparações feitas na busca. Essas informações devem ser retornadas em uma tupla. Ex:

busca_elem :: Eq a => a -> [a] -> (Bool, Int)
busca_elem n [] = (False, 1)
busca_elem n (l:ls)
    | n == l = (True, 1)
    | otherwise = let next = busca_elem n ls in ((fst next),1+(snd next))
