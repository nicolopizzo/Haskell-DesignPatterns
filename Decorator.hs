module Decorator where

import Factory
import Data.Char

decGetInfos :: Employee -> [(String, String)]
decGetInfos = capitalizeFst . getInfos . capitalizeEmployee

capitalizeFst :: [(String, String)] -> [(String, String)]
capitalizeFst = map (formatTuple capitalize)

formatTuple :: (a -> b) -> (a, c) -> (b, c)
formatTuple f t = (f $ fst t, snd t)

capitalizeEmployee :: Employee -> Employee 
capitalizeEmployee (Employee f l) = Employee (capitalize f) (capitalize l)
capitalizeEmployee (TeamManager f l tn es) = TeamManager (capitalize f) (capitalize l) (capitalize tn) es

capitalize :: String -> String
capitalize = map toUpper