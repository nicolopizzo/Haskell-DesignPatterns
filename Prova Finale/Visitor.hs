module Visitor where

class Visitable a where
    visit :: a -> String

data Employee = Employee String String | TeamManager String String String deriving (Show)
data Boh = Boh

instance Visitable Employee where
    visit Employee {} = "ciao"
    visit TeamManager {}  = "ciaoo"

instance Visitable Boh where
    visit Boh = "boh"

--  Visitor è una applicazione parziale di map? 

-- Questa cosa non si può fare in quanto haskell non consente di avere una lista simile con più tipi di dato diversi.
list :: Visitable a => [a] -> [String]
list = map visit

{- Si può al più fare una lista di un tipo di dato, definire una funzione visit per 
   le sfaccettature di quel dato e applicare parzialmente la funzione map -}
mapFullname :: [Employee] -> [String]
mapFullname = map fullname

mapCountLetters :: [Employee] -> [Int]
mapCountLetters = map countLetters

mapSalary :: [Employee] -> [Int]
mapSalary = map salary

-- Questi sarebbero i ConcreteVisitor
fullname :: Employee -> String
fullname (Employee fname lname) = fname ++ " " ++ lname
fullname (TeamManager fname lname _) = fname ++ " " ++ lname

countLetters :: Employee -> Int
countLetters (Employee fname lname) = length fname + length lname
countLetters (TeamManager fname lname _) = length fname + length lname

salary :: Employee -> Int
salary Employee{} = 1400
salary TeamManager{} = 1700