data Spec = Programmer | Engineer | TeamManager
data Employee = Employee {fName::String, lName::String} | SpecialEmployee {fName::String, lName::String, spec::Spec}
newtype Team = Team [Employee]

createTeam :: [Team -> Team] -> Team
createTeam = foldr id (Team [])

withProgrammer :: Team -> Employee -> Team
withProgrammer (Team tm) (Employee fName lName) = Team (SpecialEmployee fName lName Programmer:tm)
withProgrammer (Team tm) p@(SpecialEmployee fName lName Programmer) = Team (p:tm)

withTeamManager :: Team -> Employee -> Team
withTeamManager (Team tm) (Employee fName lName) = Team (SpecialEmployee fName lName TeamManager:tm)
withTeamManager (Team tm) t@(SpecialEmployee fName lName TeamManager) = Team (t:tm)

withEngineer :: Team -> Employee -> Team
withEngineer (Team tm) (Employee fName lName) = Team (SpecialEmployee fName lName Engineer:tm)
withEngineer (Team tm) e@(SpecialEmployee fName lName Engineer) = Team (e:tm)