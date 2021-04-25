newtype Pizza = Pizza [Condimento] deriving (Show)
data Condimento = Prosciutto | Speck deriving (Show)

getPrice :: Condimento -> Float
getPrice Prosciutto = 2.5
getPrice Speck = 4.8

getPizzaPrice :: Pizza -> Float
getPizzaPrice (Pizza condimenti) = foldl (+) 5.3 $ map getPrice condimenti

condisci :: Pizza -> String -> Pizza
condisci (Pizza condimenti) "Prosciutto" = Pizza (Prosciutto:condimenti)
condisci (Pizza condimenti) "Speck" = Pizza (Speck:condimenti)

-- Questo è il builder
inforna :: [String] -> Pizza
inforna = foldl condisci (Pizza [])