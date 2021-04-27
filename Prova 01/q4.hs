
-- sequencia maior: "bola"
-- sequencia menor: "la"

-- seque :: lista -> final -> booleano
seque :: Eq a => [a] -> [a] -> Bool
seque [] [] = True
seque [] a = False
seque _ [] = True           -- casos eliminatórios (casos nos quais necessariamente estão definidos, mas que não podem ser executados com a função recursiva)
seque (x:xs) l
    | (x:xs) == l = True    -- se for [a], ainda conta a:[] == [a]
    | xs == [] = False      -- evitar cair nos casos eliminatórios, null list exception
    | otherwise = seque xs l

