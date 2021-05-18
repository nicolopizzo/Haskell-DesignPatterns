module Composite where
import Factory

data BST a = Nil | Branch (BST a) a (BST a)

-- Tree composite
singleton :: a -> BST a
singleton x = Branch Nil x Nil

insertNode :: Ord a => BST a -> a -> BST a
insertNode Nil x = singleton x
insertNode (Branch l c r) x = case compare x c of
    GT -> Branch l c (insertNode r x)
    LT -> Branch (insertNode l x) c r

flatten :: BST a -> [a]
flatten Nil = []
flatten (Branch l x r) = flatten l ++ [x] ++ flatten r

tmap :: (a -> b) -> BST a -> BST b
tmap _ Nil = Nil
tmap f (Branch l x r) = Branch (tmap f l) (f x) (tmap f r)

-- Composite with Employee
calcExpense :: Employee -> Int
calcExpense (Employee _ _) = 800
calcExpense (TeamManager _ _ _ es) = 1200 + (sum . map calcExpense) es