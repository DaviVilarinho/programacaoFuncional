module Selection where

selecaoOri :: (Ord a) => [a] -> ([a], Int)
selecaoOri l = selecaoOri' (l, 0)

selecaoOri' :: (Ord a) => ([a], Int) -> ([a], Int)
selecaoOri' ([], cont) = ([], cont)
selecaoOri' ((head:xs), cont) = (x:selecaoRemovido, outroCont)                                      -- coloca o menor e sua tail sendo a seleção do restante menos o menor
                where x = minimo (head:xs)
                      novoCont = cont + (if head == x then 0 else 1)                                -- verifica se era o primeiro ou não, se não, houve troca
                      (selecaoRemovido, outroCont) = selecaoOri' ((remove x (head:xs)), novoCont)   -- selecao do que resta sem o menor

remove :: (Eq a) => a -> [a] -> [a]
remove a (x:xs)
    | a == x = xs
    | otherwise = x:(remove a xs)

minimo :: (Ord a) => [a] -> a
minimo [x] = x
minimo (x:xs)
    | x <= minimo xs = x
    | otherwise = minimo xs

-- Variação1: Refaça o código original para que a busca pelo menor elemento (função mínimo) e
--a eliminação desse menor elemento da lista a ser ordenada (função remove) ocorra numa
--mesma função (remove_menor), sem a necessidade de se percorrer a lista duas vezes a cada
--iteração.

selecaoVar1 :: Ord a => [a] -> ([a], Int)
selecaoVar1 l = selecaoVar1' (l, 0)

selecaoVar1' :: Ord a => ([a], Int) -> ([a], Int)
selecaoVar1' ([], contador) = ([], contador)
selecaoVar1' ([x], contador) = ([x], contador)
selecaoVar1' (x:xs, contador) = (menor:selecaoResto, tempResto) 
                            where (listaResta, menor)       = remove_menor (x:xs) 
                                  tempCont                  = if xs == listaResta then contador else contador + 1
                                  (selecaoResto, tempResto) = selecaoVar1' (listaResta, tempCont)

remove_menor :: Ord l => [l] -> ([l], l)            -- retorna a lista sem e o menor
remove_menor [y] = ([], y)
remove_menor (x:xs)                                 -- compara o menor com o menor do restante
    | x < minResto = (xs, x)                        -- se for o menor então é ele com a lista do restante
    | otherwise    = (x:listaResto, minResto)       -- se não for ele é parte da lista do que ainda não é menor e o menor do restante
    where (listaResto, minResto) = remove_menor xs

--  -- var 2: foldr ou foldr1
--  --selecaoVar2 :: Ord a => [a] -> ([a],Int)
--  
--  --selecaoVar2 xs = foldr 