data State = Available | Taken deriving (Show)
data Resource = Resource { id :: String
                         , content :: String
                         , state :: State }

isAvailable :: Resource -> Bool 
isAvailable (Resource _ _ Available) = True
isAvailable _ = False

takeResource :: Resource -> String -> Resource
takeResource (Resource id c Available) s = Resource id s Taken
takeResource r _ = r