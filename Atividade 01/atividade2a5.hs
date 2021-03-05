-- questão 2
dobra n = 2*n

-- questão 3
quadruplica n = dobra(dobra n)

-- questão 4
hipotenusa b c = sqrt(b^2 + c^2)

-- questão 5
distance (x1, y1) (x2, y2) = sqrt((x1-x2)^2 + (y1-y2)^2)

-- testes com a main das questões acima
main = do
    putStrLn $ "Dobro de 5 é: " dobra 5
    putStrLn $ "Quádruplo de 6 é: " ++ quadruplica 6
    putStrLn $ "A hipotenusa do triângulo retângulo formado pelos catetos 6 e 8 é: " ++ hipotenusa 6 8
    putStrLn $ "A distância entre os pontos (1,1) e (2,2) é: " ++ distance (1,1) (2,2)
