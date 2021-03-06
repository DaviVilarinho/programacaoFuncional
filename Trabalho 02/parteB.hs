-- 6
---- a
data Exp =
    Val Int
    | Add Exp Exp
    | Sub Exp Exp
    | Mult Exp Exp
    | Divi Exp Exp

avalia (Val x) = x
avalia (Add exp1 exp2) = (avalia exp1) + (avalia exp2)
avalia (Sub exp1 exp2) = (avalia exp1) - (avalia exp2)
avalia (Mult exp1 exp2) = (avalia exp1) * (avalia exp2)
avalia (Divi exp1 exp2) = (avalia exp1) `div` (avalia exp2)

--B--- --------- ---B--
------ QUESTAO B ------
--B--- --------- ---B--
--  *Main> exp1 = (Divi (Val (avalia (Mult (Val (avalia (Add (Val 3) (Val 12)))) (Val (avalia (Add (Val 15) (Val 5))))))) (Val (avalia(Mult (Val 1) (Val 3)))))
--  *Main> avalia exp1
--  100

--  *Main> exp2 = (Sub (Val 0) (Val (avalia (Mult (Val (avalia (Add (Val (avalia (Sub (Val ((avalia (Add (Val 6) (Val 8))))) (Val 5))) ) (Val 1)))) (Val (avalia (Add (Val 2) (Val (avalia (Divi (Val 6) (Val 2)))))))))))
--  *Main> avalia exp2
--  -50

-----------------------------------
-- 7 - Pedra papel e Tesoura

---- a
data Jogo =
      Pedra
    | Papel
    | Tesoura

---- b

vence :: Jogo -> Jogo -> Bool
vence Papel Pedra       = True
vence Papel Tesoura     = False 
vence Pedra Papel       = False 
vence Pedra Tesoura     = True
vence Tesoura Papel     = True
vence Tesoura Pedra     = False
vence _ _ = False

---- c
vencedoras :: [(Jogo, Jogo)] -> [Bool]
vencedoras xs = map (\y -> (fst y) `vence` (snd y)) xs

------------------------------------
-- 8
---- a
data Nebuloso =
      Falso
    | Talvez Float
    | Verdadeiro
    deriving Show

---- b
fuzzifica :: Float -> Nebuloso
fuzzifica a
    | a <= 0    = Falso
    | a >= 1    = Verdadeiro
    | otherwise = Talvez a

---- c
verifica_alto :: Float -> Nebuloso
verifica_alto altura = fuzzifica $ (altura - 1.70)/0.2

---- d
verifica_barato :: Float -> Nebuloso
verifica_barato custo = fuzzifica $ (50000-custo)/20000

------------------------------------
-- 9 -
---- a
data Aluno =
      Universitario {
            universidade::String,
            curso::String,
            matriculaU::Double,
            altura::Float,
            idade::Int
        } 
    | Colegial {            
            ano::Int,
            colegio::String,
            matriculaC::String,
            altura::Float,
            peso::Float 
        } 
    deriving Show

---- b
uni =      [Universitario "UFU" "Computa????o"         11111111 1.91 20]
          ++ [Universitario "UNITRI" "Medicina"   22345678 1.8 30]
          ++ [Universitario "UNA" "Direito"       32345678 1.71 23]
          ++ [Universitario "UFU" "M??sica"        42345678 1.6 24]
          ++ [Universitario "UNITRI" "Computa????o" 52345678 1.95 21]
          ++ [Universitario "UNA" "Medicina"      62345678 1.85 26]
          ++ [Universitario "UFU" "Direito"       72345678 1.75 27]
          ++ [Universitario "UNITRI" "M??sica"     82345678 1.65 21]
          ++ [Universitario "UNA" "Computa????o"    92345678 1.72 18]
          ++ [Universitario "UFU" "Direito"       99999999 1.5 19]
col =        [Colegial      3 "Olimpo"   "aaaaa" 1.5 50]
          ++ [Colegial      2 "Olimpo"   "bbbbb" 1.6 60]
          ++ [Colegial      1 "Nacional" "ccccc" 1.71 65]
          ++ [Colegial      1 "Gabarito" "ddddd" 1.55 40]
          ++ [Colegial      1 "Gabarito" "eeeee" 1.73 42]
          ++ [Colegial      2 "Nacional" "ababa" 1.83 72]
          ++ [Colegial      3 "Nacional" "kadaf" 1.98 102]
          ++ [Colegial      1 "Olimpo"   "gobrf" 1.78 37]
          ++ [Colegial      3 "Gabarito" "never" 1.92 77]
          ++ [Colegial      3 "Olimpo"   "fever" 1.88 77]
estudantes = uni ++ col

descobre_altos :: [Aluno] -> [(Double, Nebuloso)]
descobre_altos x = map (\y -> (matriculaU y, verifica_alto (altura y))) x 
------------------------------------
-- 10 -
data ArvBinInt =
      Nulo
    | No Int ArvBinInt ArvBinInt
    deriving Show

folhas :: ArvBinInt -> [Int]
folhas Nulo = []
folhas (No a no1 no2) = a:((folhas no1) ++ (folhas no2))                           -- pre-ordem, direita vem depois
folhas' Nulo = []
folhas' (No a (Nulo) no2) = (folhas' no2) ++ [a]
folhas' (No a (No a1 no11 no12) no2) = (folhas' no11) ++ (folhas' no12) ++ [a1] ++ (folhas' no2) ++ [a]

somaNosInternos :: ArvBinInt -> Int
somaNosInternos Nulo = 0                -- nessa busca, a busca ocorre nos n??s extremos, da esquerda para a direita, e por ??ltimo a raiz
somaNosInternos (No a (Nulo) no2) = (somaNosInternos no2) + a                      -- se esquerda vazia
somaNosInternos (No a (No a1 no11 no12) no2) = (somaNosInternos no11) + (somaNosInternos no12) + a1 + (somaNosInternos no2) + a -- se esquerda existe

pertence :: Int -> ArvBinInt ->  Bool
pertence x Nulo = False
pertence x (No a Nulo Nulo) = x == a || False
pertence x (No a (No a1 no11 no12) (Nulo)) = (pertence x no11) || -- se est?? ?? esquerda ainda
                                             x == a1         || -- se ?? o pr??prio n??
                                             (pertence x no12) || -- se est?? a direita do n??
                                             x == a             -- se ?? a raiz

pertence x (No a (Nulo) (No a2 no21 no22)) = x == a          || -- raiz ?? o primeiro a se comparar, se nada a esquerda
                                             (pertence x no21) || -- se est?? a esquerda no n??
                                             x == a2         || -- se ?? o do n??
                                             (pertence x no22)    -- se ainda est?? a direita do n??

pertence x (No a (No a1 no11 no12) (No a2 no22 no21)) = (pertence x no11) || -- se est?? depois pela esquerda 
                                                        a1 == x           || -- se est?? no imediato n?? a esquerda
                                                        (pertence x no12) || -- se est?? depois pela direita
                                                        a == x            || -- se est?? na raiz
                                                        (pertence x no22) || -- est?? pela esquerda, na direita
                                                        a2 == x           || -- se ?? o n?? imediato a direita
                                                        (pertence x no21)    -- se ainda est?? pela esquerda
