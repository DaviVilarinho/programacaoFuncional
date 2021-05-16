module Quicksort where


quickSortOri :: (Ord a) => [a] -> ([a], Int)
quickSortOri [] = ([],0)
quickSortOri (x:xs) = (foldr1 (++) [menoresOrd, [x], maioresOrd], newCount)        -- concatena os menores ordenados, e soma seus contadores na ordenação do quicksort
                        where (menores, contCmin) = menor x xs
                              (maiores, contCMaj) = maior x xs
                              countComparisons = contCMaj + contCmin
                              (menoresOrd, counterMen) = quickSortOri menores
                              (maioresOrd, counterMai) = quickSortOri maiores
                              newCount = countComparisons + counterMen + counterMai

menor :: Ord a => a -> [a] -> ([a], Int)
menor a [] = ([], 0)
menor a (x:xs)
  | x < a = (x:menoresResto, 1 + contResto)
  | otherwise = (menoresResto, 1 + contResto)
  where (menoresResto, contResto) = menor a xs

maior :: Ord a => a -> [a] -> ([a], Int)
maior a [] = ([], 0)
maior a (x:xs)
  | x >= a =   (x:maioresResto, 1 + contResto)
  | otherwise = (maioresResto, 1 + contResto)
  where (maioresResto, contResto) = maior a xs

----------------------------------------------------------------------------------------------------------------------------------
quickSortVar1 :: (Ord a) => [a] -> ([a], Int)
quickSortVar1 l = quickSortVar1' (l, 0)

quickSortVar1' :: (Ord a) => ([a], Int) -> ([a], Int)
quickSortVar1' ([],counter) = ([],counter)
quickSortVar1' ((x:xs), counter) = (foldr1 (++) [menoresOrd, [x], maioresOrd], newCount)        -- concatena os menores ordenados, e soma seus contadores na ordenação do quicksort
                        where (menores,maiores,countComparisons) = divide x xs 0
                              (menoresOrd, counterMen) = quickSortVar1' (menores, 0)
                              (maioresOrd, counterMai) = quickSortVar1' (maiores, 0)
                              newCount = countComparisons + counterMen + counterMai

divide :: Ord a => a -> [a] -> Int -> ([a], [a], Int)
divide _ [] count = ([], [], count)
divide y (x:xs) count
        | x < y     = (x:menoresRest, maioresRest, novoCount+1)
        | otherwise = (menoresRest, x:maioresRest, novoCount+1)
        where (menoresRest, maioresRest, novoCount) = divide y xs count

--------------------------------------------------------------

--
-- Variação 2: modifique a variação 1 para que o elemento pivô seja obtido a partir da análisedos 3 primeiros elementos da lista, sendo que o pivô será o elemento mediano entre eles.Exemplo: na lista [3, 9, 4, 7, 8, 1, 2], os elementos 3, 9 e 4 seriam analisados e o pivô escolhidoseria 4.  Caso a lista a ser analisada tenha menos que 3 elementos, o pivô é sempre o primeiro.])
-- 

median :: Ord a => [a] -> (a, [a], Int)
median [x]   = (x, [], 0)
median [x,y] = (x, [y], 0)
median l = (b, a:c:resto, cont)
      where (tres, resto) = (take 3 l, drop 3 l)
            ([a,b,c], cont) = quickSortVar1 tres        -- ordena os tres
           

quickSortVar2 :: Ord a => [a] -> ([a], Int)
quickSortVar2 [] = ([], 0)
quickSortVar2 l = (menoresOrd ++ [med] ++ maioresOrd, newCount)
    where (med, noMedian, countMedian) = median l
          (menores, maiores, countDivide) = divide med (noMedian) countMedian
          (menoresOrd, countMen) = quickSortVar2 menores
          (maioresOrd, countMai) = quickSortVar2 maiores
          newCount = countDivide + countMen + countMai