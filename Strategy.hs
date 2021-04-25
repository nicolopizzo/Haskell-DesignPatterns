module Strategy where
import Factory

-- Il pattern strategy è la funzione identità: f(x) = x => repr = id
repr :: (Employee -> String) -> Employee -> String
repr f = f
-- repr = id

toJSON :: Employee -> String
toJSON (Employee f l) = "{firstName: " ++ f ++ ", lastName: " ++ l ++  "}"
toJSON (TeamManager f l tn es) =     "{firstName: " ++ f
                                  ++ ", lastName: " ++ l
                                  ++ ", teamName: " ++ tn
                                  ++ ", teamMembers: [" ++ init (concatMap (\x -> toJSON x ++ ",") es)
                                  ++ "]"

plain :: Employee -> String
plain (Employee f l) =    "First name: " ++ f
                       ++ "\nLast name: " ++ l
plain (TeamManager f l tn es) =    plain (Employee f l)
                                ++ "\nTeam name: " ++ tn
                                ++ "\nMembers: " ++ concatMap (indentate . ('\n':) . plain) es

indentate :: String -> String
indentate ('\n':xs) = "\n\t" ++ indentate xs
indentate (x:xs) = x : indentate xs
indentate [] = []