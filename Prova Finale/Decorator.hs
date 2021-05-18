import Data.Char

data Employee = Employee {fName:: String, lName:: String}

{- Poichè il pattern decorator consiste nell'aggiungere nuovi comportamenti ad un oggetto esistente,
   da un punto di vista funzionale ciò si effettua utlizzando la composizione di funzioni. In particolare
   la funzione che si vuole decorare sarà l'ultima ad essere applicata (in modo tale da mantenere intatta la "natura"
   della funzione), mentre le altre possono essere applicate in modo arbitrario di modo che il comportamento
   possa variare in più modi. -}

-- Supponiamo di voler decorare la seguente funzione che, dato un Employee, concateni nome e cognome.
employeeIdentity :: Employee -> String
employeeIdentity e = fName e ++ " " ++ lName e

upperEmployee :: Employee -> Employee
upperEmployee (Employee f l) = Employee (toUpperCase f) (toUpperCase l)

toUpperCase :: String -> String
toUpperCase = map toUpper

lowerEmployee :: Employee -> Employee
lowerEmployee (Employee f l) = Employee (toLowerCase f) (toLowerCase l)

toLowerCase :: String -> String
toLowerCase = map toLower

withInitials :: Employee -> Employee
withInitials (Employee f l) = Employee [head f] [head l]

{- Supponiamo adesso di voler decorare questa funzione. Ciò significa che la firma finale della funzione rimarrà la stessa. -}
decorateIdentity :: [Employee -> Employee] -> (Employee -> String)
decorateIdentity = foldl (.) employeeIdentity

{- Più in generale, si può pensare che la firma di un decoratore qualsiasi sia la seguente,
   e che applicando tale funzione in modo parziale si ottengono decoratori specifici. -}
decorate :: (a -> b) -> [a -> a] -> (a -> b)
decorate = foldl (.)

-- Si può infatti ridefinire decorateIdentity facendo uso del decoratore generico sopra creato nel seguente modo
decorateIdentity' :: [Employee -> Employee] -> (Employee -> String)
decorateIdentity' = decorate employeeIdentity