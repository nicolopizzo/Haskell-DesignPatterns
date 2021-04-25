module Factory where

data Employee = Employee String String | TeamManager String String String [Employee] deriving (Show)

getInfos :: Employee -> [(String, String)]
getInfos (Employee f l) = [("Firstname", f), ("Last Name", l)]
getInfos (TeamManager f l tn es) = getInfos (Employee f l) ++ [("Team Name", tn), ("Team Members", show $ length es)]