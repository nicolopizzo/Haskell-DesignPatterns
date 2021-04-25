module Adapter where
import qualified Factory as F ( Employee(..) )
data Employee = Employee String String | TeamManager String String String deriving (Show)

getInfos :: Employee -> [(String, String)]
getInfos (Employee f l) = [("First Name", f), ("Last Name", l)]
getInfos (TeamManager f l tn) = [("First Name", f), ("Last Name", l), ("Team Name", tn)]

adaptEmployee :: F.Employee  -> Employee
adaptEmployee (F.Employee f l) = Employee f l
adaptEmployee (F.TeamManager f l tn _) = TeamManager f l tn

getNewInfos :: F.Employee -> [(String, String)]
getNewInfos = getInfos . adaptEmployee