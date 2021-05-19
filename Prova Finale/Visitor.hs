module Visitor where

data Employee = Employee String String | TeamManager String String String deriving (Show)

{- Si può al più fare una lista di un tipo di dato, definire una funzione (ConcreteVisitor).
   Le ObjectStructure sulle quali si può applicare tale funzione sono dei funtori,
   e si applica parzialmente la funzione fmap -}
mapFullname :: Functor f => f Employee -> f String
mapFullname = fmap fullname

mapCountLetters :: Functor f => f Employee -> f Int
mapCountLetters = fmap countLetters

mapSalary :: Functor f => f Employee -> f Int
mapSalary = fmap salary

-- Questi sarebbero i ConcreteVisitor, semplici funzioni
fullname :: Employee -> String
fullname (Employee fname lname) = fname ++ " " ++ lname
fullname (TeamManager fname lname _) = fname ++ " " ++ lname

countLetters :: Employee -> Int
countLetters (Employee fname lname) = length fname + length lname
countLetters (TeamManager fname lname _) = length fname + length lname

salary :: Employee -> Int
salary Employee{} = 1400
salary TeamManager{} = 1700