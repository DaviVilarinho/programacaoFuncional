module Bolha where

bolhaOri :: Ord a => [a] -> ([a], Int)
bolhaOri [] = ([], 0)
bolhaOri l = bolhaOriginal l (length l) 0

bolhaOriginal :: Ord a => [a] -> Int -> Int -> ([a], Int)
bolhaOriginal l 0 counter = (l, counter) 
bolhaOriginal l n counter = bolhaOriginal (fst trocas) (n-1) (counter + snd trocas)                 -- troca até que tenha trocado length l vezes
                            where trocas = troca (l, 0)

troca :: Ord a => ([a], Int) -> ([a], Int)
troca ([x], count) = ([x], count)
troca ((x:xs:xss), count)
    | x > xs    = ((xs:restoTroca), contTroca)
    | otherwise = ((x:restoSemTroca), contSemTroca)
    where (restoTroca, contTroca)        = troca ((x:xss), count + 1)            
          (restoSemTroca, contSemTroca)  = troca ((xs:xss), count)               

-----------------------------------------------------------
-- Variação 1: parada do algoritmo é antecipada quando uma iteração de trocas é finalizada sem
-- que nenhuma troca efetiva seja realizada na iteração completa.

bolhaVar1 :: Ord a => [a] -> ([a], Int)
bolhaVar1 l = bolhaVar1' (l, 0)

bolhaVar1' :: Ord a => ([a], Int) -> ([a], Int)
bolhaVar1' (l, counter)                             -- realize o troca 
    | lr == l   = (l, counter)                      -- contador igual porque sem trocas
    | otherwise = bolhaVar1' (lr, (counter + cr))   -- se não igual lr com o trocado, chama novamente com o troca realizado e o maior no final 
    where (lr, cr) = troca (l, 0)

-- nesse caso não é necessário sequer função auxiliar (além do troca) e nem do len, uma vez que basta repetir troca até que não troque em nenhum ponto 
--  
--  -------------------------------------------------------------
--  Variação 2: faz parada antecipada e, a cada iteração de trocas, a avaliação é realizada
--  desconsiderando-se o último elemento cuja posição foi fixada. Ou seja, diminui o tamanho da
--  lista a ser ordenada a cada iteração.

bolhaVar2 :: Ord a => [a] -> ([a], Int)
bolhaVar2 l = bolhaVar2' l [] 0
bolhaVar2' :: Ord a => [a] -> [a] -> Int -> ([a], Int)
bolhaVar2' l ol counter                                                                 -- acumulador 'ol' sendo lista ordenada
    | listaTroca == l = (l++ol, counter)
    | otherwise = bolhaVar2' faltaOrd ([jaOrd] ++ ol) (counter + contadorListaTrocada)  -- recursão colocando o maior valor dessa iteração no início da lista ordenada acumuladora
    where (listaTroca, contadorListaTrocada) = troca (l, 0)                             -- realiza a troca
          faltaOrd    = init listaTroca                                                 -- removendo último elemento para próxima chamada
          jaOrd       = last listaTroca