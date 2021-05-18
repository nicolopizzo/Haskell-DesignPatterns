module Adapter where
import qualified Factory as F ( Employee(..) )
{- Supponiamo che la nuova azienda non abbia interesse, nel caso dei Team Manager, di tenere conto degli Employee che fanno parte di un
   certo team, dunque devo adattare il vecchio employee al nuovo tipo di employee -}
data Employee = Employee String String | TeamManager String String String deriving (Show)

getInfo :: Employee -> [(String, String)]
getInfo (Employee f l) = [("First Name", f), ("Last Name", l)]
getInfo (TeamManager f l tn) = [("First Name", f), ("Last Name", l), ("Team Name", tn)]

adaptEmployee :: F.Employee  -> Employee
adaptEmployee (F.Employee f l) = Employee f l
adaptEmployee (F.TeamManager f l tn _) = TeamManager f l tn

getNewInfo :: F.Employee -> [(String, String)]
getNewInfo = getInfo . adaptEmployee