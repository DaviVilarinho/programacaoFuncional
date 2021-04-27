-- Defina a função representante que recebe uma sequência de consoantes s e uma lista de palavras (dicionário) e retorna a lista das palavras do dicionário que são representadas pela sequência s. Ou seja, quando as vogais são eliminadas de uma palavra do dicionário, elas são representadas por uma sequência de consoantes que restam, incluindo repetições, e na mesma ordem. Ex: “vc” é a sequência que representa as palavras "vaca","vacuo","vicio", mas não representa "velho" e vermelho".

--  Ex: 

--   dicionario = ["arara","arreio","haskell", "puxa","peixe","pixar","pixe", "vaca","vacuo","velho","vermelho","vicio"]

--   representante "vc" dicionario

-- ["vaca","vacuo","vicio"]
--
-- dicionario = ["cola",“calo”,"cala"]
--sequencia de consoantes: “cl”


dicionario :: [String]
dicionario = ["arara","arreio","haskell", "puxa","peixe","pixar","pixe", "vaca","vacuo","velho","vermelho","vicio"]

representante :: String -> [String] -> [String]
representante [] x = x
representante x [] = []
representante (x:xs) dicionario = representante xs [a | a <- dicionario, x `elem` a]

--  representante l dicionario =  
--      where semVog = map (removeVogal x) dicionario

--  vogais = ['a','e','i','o','u']
--  removeVogal [] = []
--  removeVogal (x:xs)
--      | x `elem` vogais = removeVogal xs
--      | otherwise = x:removeVogal xs
        
