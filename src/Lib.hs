module Lib
  ( contains,
    setOf,
    inter2,
    intersection,
  )
where

contains :: (Eq a) => a -> [a] -> Bool
contains _ [] = False
contains x (y : ys) = x == y || contains x ys

-- Построить множество элементов (удалить повторяющиеся)
setOf :: (Eq a) => [a] -> [a]
setOf [] = []
setOf (x : xs) = if contains x (setOf xs) then setOf xs else x : setOf xs

-- Пересечение двух множеств (удалить повторяющиеся)
inter2 :: (Eq a) => [a] -> [a] -> [a]
inter2 _ [] = []
inter2 [] _ = []
inter2 xs ys = setOf [x | x <- xs, contains x ys]

-- Пересечение n множеств
intersection :: (Eq a) => [[a]] -> [a]
intersection [[]] = []
intersection [x] = x
intersection (x : xs) = inter2 x (intersection xs)
