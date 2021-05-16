module Quicksort where

quicksortOri :: (Ord a) => [a] -> [a]
quicksortOri [] = []
quicksortOri (s:xs) = quicksortOri [x | x <- xs, x < s]
                   ++ [s] ++
                   quicksortOri [x | x <- xs, x >= s]

quicksortVar1 :: (Ord a) => [a] -> [a]
quicksortVar1 [] = []
quicksortVar1 (s:xs) = let dividido = divide s xs in quicksortVar1 (head dividido) ++ [s] ++ quicksortVar1 (last dividido)

divide :: (Ord a) => a -> [a] -> [[a]]
divide a l = [[x | x <- l, x < a], [x | x <- l, x > a]]

--
-- Variação 2: modifique a variação 1 para que o elemento pivô seja obtido a partir da análisedos 3 primeiros elementos da lista, sendo que o pivô será o elemento mediano entre eles.Exemplo: na lista [3, 9, 4, 7, 8, 1, 2], os elementos 3, 9 e 4 seriam analisados e o pivô escolhidoseria 4.  Caso a lista a ser analisada tenha menos que 3 elementos, o pivô é sempre o primeiro.])
-- 

median :: (Ord a) => [a] -> a
median [x] = x
median [x,_] = x 
median [x,y,z]
  | x <= y && y <= z = y
  | y <= x && x <= z = x
  | otherwise = z

quicksortVar2 :: (Ord a) => [a] -> [a]
quicksortVar2 [] = []
quicksortVar2 l = let med = median $ take 3 l
                      dividido = divide med l in 
                      quicksortVar2 (head dividido) ++ [med] ++ quicksortVar2 (last dividido)

