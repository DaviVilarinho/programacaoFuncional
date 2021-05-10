module Bolha where

bolhaOri :: Ord a => [a] -> [a]
bolhaOri [] = [] 
bolhaOri l = bolhaOriginal l (length l)

bolhaOriginal :: Ord a => [a] -> Int -> [a]
bolhaOriginal l 0 = l
bolhaOriginal l n = bolhaOriginal (troca l) (n-1)

troca :: Ord a => [a] -> [a]
troca [x] = [x]
troca (x:y:zs)
    | x > y     = y:troca(x:zs)
    | otherwise = x:troca(y:zs)

-----------------------------------------------------------
-- Variação 1: parada do algoritmo é antecipada quando uma iteração de trocas é finalizada sem
-- que nenhuma troca efetiva seja realizada na iteração completa.

bolhaVar1 :: Ord a => [a] -> [a]
bolhaVar1 l
    | trocado == l = l
    | otherwise = bolhaVar1 trocado
    where trocado = troca l 

-- nesse caso não é necessário sequer função auxiliar (além do troca) e nem do len, uma vez que basta repetir troca até que não troque em nenhum ponto 

-------------------------------------------------------------
--  Variação 2: faz parada antecipada e, a cada iteração de trocas, a avaliação é realizada
--  desconsiderando-se o último elemento cuja posição foi fixada. Ou seja, diminui o tamanho da
--  lista a ser ordenada a cada iteração.

bolhaVar2 :: Ord a => [a] -> [a]
bolhaVar2 l
    | trocado == l = l
    | otherwise = (bolhaVar2 (init trocado)) ++ [last trocado]
    where trocado = troca l 