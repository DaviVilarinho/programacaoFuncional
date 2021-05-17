module Mergesort where

intercala :: Ord a => [a] -> [a] -> ([a], Int)
intercala [] ys = (ys, 0)
intercala xs [] = (xs, 0)
intercala (x:xs) (y:ys) 
    | x < y     = (x:xMenor, contX + 1)
    | otherwise = (y:yMenor, contY + 1)
    where (xMenor, contX) = intercala xs (y:ys)
          (yMenor, contY) = intercala (x:xs) ys


mergesort :: Ord a => [a] -> ([a], Int)
mergesort []  = ([], 0)
mergesort [x] = ([x], 0)
mergesort xs  = (intercalado, c+c1+c2)
     where (intercalado, c) = intercala met1Sorted met2Sorted
           (met1Sorted, c1) = mergesort met1
           (met2Sorted, c2) = mergesort met2
           (met1, met2) = splitAt metade xs
           metade = length xs `div` 2