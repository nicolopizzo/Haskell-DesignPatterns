newtype Pizza = Pizza [Condimento] deriving (Show)
data Condimento = Prosciutto | Speck deriving (Show)

class HasPrice a where
    price :: a -> Double

instance HasPrice Condimento where
    price Prosciutto = 2.5
    price Speck = 4.8

instance HasPrice Pizza where
    price (Pizza condimenti) = foldl (+) 5.3 $ map price condimenti

condisci :: String -> Pizza -> Pizza
condisci "Prosciutto" (Pizza condimenti) = Pizza (Prosciutto:condimenti)
condisci "Speck" (Pizza condimenti) = Pizza (Speck:condimenti)

-- Questo è il builder
inforna :: Foldable t => t (Pizza -> Pizza) -> Pizza
inforna = foldr id (Pizza [])

{- Prima era
condisci :: Pizza -> String -> Pizza
...

inforna :: [String] -> Pizza
inforna = foldl condisci (Pizza [])
 -}

data Car = Car {seats::Maybe Int, engine::Maybe String} deriving (Show)

withSeats :: Int -> Car -> Car
withSeats n c = c{seats = Just n}

withEngine :: String -> Car -> Car
withEngine e c = c{engine = Just e}

buildCar :: [Car -> Car] -> Car
buildCar = foldr id (Car Nothing Nothing)