-- Escreva a função seleciona usando lista por compreensão, que recebe uma lista de sublistas de inteiros (por exemplo, [[1,6,3],[6,4],[2],[9,4,3],[3,6,5,5],[8]]). Ela deve retornar a cabeça das listas cujas caudas iniciam com um número maior que 5 (em uma nova lista). 

-- No exemplo, retornar [1,3].
-- [[1,2,3],[7],[3,6,7,8],[2],[9,1,3,4,5],[8,8]]

seleciona :: [[Int]] -> [Int]
seleciona l = [head x | x <- l, (cabecaDaCalda x) > 5]

-- protegido de empty list
cabecaDaCalda :: [Int] -> Int
cabecaDaCalda [] = -1 -- falha
cabecaDaCalda [x] = -1 -- outra falha
cabecaDaCalda (x:xs:xss) = xs
