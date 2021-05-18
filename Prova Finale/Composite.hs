module Composite where

data Employee = Employee { fName::String, lName::String } 
              | TeamManager { fName::String, lName::String, tName::String, team::[Employee] }

budget :: Employee -> Int
budget (Employee _ _) = 1200
budget (TeamManager _ _ _ team) = 1400 + (sum . map budget) team