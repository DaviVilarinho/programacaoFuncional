module Quicksort where

quicksortOri :: (Ord a) => [a] -> [a]
quicksortOri [] = []
quicksortOri (s:xs) = quicksortOri [x | x <- xs, x < s]
                   ++ [s] ++
                   quicksortOri [x | x <- xs, x >= s]

-- Variação   1:   modifique   o   algoritmo   original   para   que   ao   invés   dos   elementos   maiores   emenores serem  encontrados com   buscas independentes,  que  seja   elaborada    e  utilizada   afunção divide que percorre a lista uma única vez, retornando os elementos menores em umalista e os elementos menores em outra. EX: > divide 'j' "pindamonhangaba" Resposta: ("idahagaba","pnmonn")- 

quicksortVar1 :: (Ord a) => [a] -> [[a]]
quicksortVar1 [] = []
quicksortVar1 (s:xs) = map (foldl2) (divide s xs)

divide a l = [[x | x <- l, x < a], [x | x <- l, x > a]]

--
-- Variação 2: modifique a variação 1 para que o elemento pivô seja obtido a partir da análisedos 3 primeiros elementos da lista, sendo que o pivô será o elemento mediano entre eles.Exemplo: na lista [3, 9, 4, 7, 8, 1, 2], os elementos 3, 9 e 4 seriam analisados e o pivô escolhidoseria 4.  Caso a lista a ser analisada tenha menos que 3 elementos, o pivô é sempre o primeiro.])
