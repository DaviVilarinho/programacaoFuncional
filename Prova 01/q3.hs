-- Usando apenas definições recursivas para manipular listas, defina a função recursiva retira_varias que dadas duas listas, retira da segunda lista a primeira ocorrência de cada elemento que ocorre na primeira lista. Atenção: não é possível utilizar as funções para manipulação de listas do módulo Prelude (ex: head, tail, elem, etc)..

--Lista de onde os elementos vão ser removidos: [2,3,2,1,4,3]
--Lista que indica os elementos que devem ser removidos [3,2]

retira_varias :: Eq a => [a] -> [a] -> [a]
retira_varias [] a = a
retira_varias [r] l = retira r l
retira_varias (r:rs) l = retira r l

retira :: Eq a => a -> [a] -> [a]
retira x (r:rs)
    | x == r = rs
    | otherwise = r:(retira x rs)
