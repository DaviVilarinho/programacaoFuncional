module Insert where

insercaoOri :: (Ord a) => [a] -> ([a], Int)
insercaoOri xs = insercao (xs, 0)

insercao :: (Ord a) => ([a], Int) -> ([a], Int)
insercao ([],cont) = ([], cont)
insercao (x:xs, cont) = (insercaoX, contResto)                          
        where (insercaoX, contX) = insercaoOrd x (insercaoResto, cont)          -- o resultado é a inserção ordenada de x na inserção do restante
              (insercaoResto, contResto) = insercao (xs, contX)                

insercaoOrd :: (Ord a) => a -> ([a], Int) -> ([a], Int)
insercaoOrd x ([], cont) = ([x], cont)                                                  -- se não houver mais é a última posição
insercaoOrd x (y:ys, cont)                                                -- a inserção ordenada é encontrar onde por o x
    | x <= y =  ((x:y:ys), cont)                                                -- se o x for menor que o próximo elemento, é ali
    | otherwise = (y:listaInsertResto, contResto)                               -- onde há trocas, y passa para a posição anterior à x (não necessariamente imediata)
    where (listaInsertResto, contResto) = insercaoOrd x (ys, cont+1)            -- a posição de x é na inserção ordenada de x no restante da lista sem o y

---------------------------------------------------------------------------

-- foldr

insercaoFoldr :: (Ord a) => [a] -> ([a], Int)
insercaoFoldr l = insercaoFoldr' (l, 0)

insercaoFoldr' :: (Ord a) => ([a], Int) -> ([a], Int)
insercaoFoldr' ([], counter) = ([], counter)
insercaoFoldr' (l, counter) = foldr (insercaoOrd) ([], 0) l                 -- inserir ordenadamente numa lista que está inserida ordenadamente