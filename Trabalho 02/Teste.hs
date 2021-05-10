module Teste where 
import Bolha
import Quicksort

l1=[1..2000]
l2=[2000,1999..1]
l3=l1++[0]
l4=[0]++l2
l5=l1++[0]++l2
l6=l2++[0]++l1
l7=l2++[0]++l2
x1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
x2=[20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
x3=[11,12,13,14,15,16,17,18,19,20,1,2,3,4,5,6,7,8,9,10]
x4=[10,9,8,7,6,5,4,3,2,1,20,19,18,17,16,15,14,13,12,11]
x5=[11,12,13,14,15,5,4,3,2,1,16,17,18,19,20,10,9,8,7,6]
x6=[1,12,3,14,5,15,4,13,2,11,6,17,8,19,20,10,9,18,7,16]
x7=[20,8,2,11,13,3,7,18,14,4,16,10,15,1,9,17,19,12,5,6]

main :: IO ()
main = do
--  putStrLn $ show (bolhaOri l1)
--  putStrLn $ show (bolhaOri l2)
--  putStrLn $ show (bolhaOri l3)
--  putStrLn $ show (bolhaOri l4)
--  putStrLn $ show (bolhaOri l5)
--  putStrLn $ show (bolhaOri l6)
--  putStrLn $ show (bolhaOri l7)
--  putStrLn $ show (bolhaOri x1)
--  putStrLn $ show (bolhaOri x2)
--  putStrLn $ show (bolhaOri x3)
--  putStrLn $ show (bolhaOri x4)
--  putStrLn $ show (bolhaOri x5)
--  putStrLn $ show (bolhaOri x6)
--  putStrLn $ show (bolhaOri x7)
--  putStrLn $ show (bolhaVar1 l1)
--  putStrLn $ show (bolhaVar1 l2)
--  putStrLn $ show (bolhaVar1 l3)
--  putStrLn $ show (bolhaVar1 l4)
--  putStrLn $ show (bolhaVar1 l5)
--  putStrLn $ show (bolhaVar1 l6)
--  putStrLn $ show (bolhaVar1 l7)
--  putStrLn $ show (bolhaVar1 x1)
--  putStrLn $ show (bolhaVar1 x2)
--  putStrLn $ show (bolhaVar1 x3)
--  putStrLn $ show (bolhaVar1 x4)
--  putStrLn $ show (bolhaVar1 x5)
--  putStrLn $ show (bolhaVar1 x6)
--  putStrLn $ show (bolhaVar1 x7)
    putStrLn $ show (bolhaVar2 l1)
    putStrLn $ show (bolhaVar2 l2)
    putStrLn $ show (bolhaVar2 l3)
    putStrLn $ show (bolhaVar2 l4)
    putStrLn $ show (bolhaVar2 l5)
    putStrLn $ show (bolhaVar2 l6)
    putStrLn $ show (bolhaVar2 l7)
    putStrLn $ show (bolhaVar2 x1)
    putStrLn $ show (bolhaVar2 x2)
    putStrLn $ show (bolhaVar2 x3)
    putStrLn $ show (bolhaVar2 x4)
    putStrLn $ show (bolhaVar2 x5)
    putStrLn $ show (bolhaVar2 x6)
    putStrLn $ show (bolhaVar2 x7)
