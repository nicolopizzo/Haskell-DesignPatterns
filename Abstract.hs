data OS = Linux | MacOS | Windows

newtype Button = Button OS
click :: Button -> String
click (Button Linux) = "Created Linux Button"
click (Button MacOS) = "Created Mac Button"
click (Button Windows) = "Created Windows Button"

newtype Checkbox = Checkbox OS
check :: Checkbox -> String
check (Checkbox Linux) = "Checked Linux"
check (Checkbox MacOS) = "Checked MacOS"
check (Checkbox Windows) = "Checked Windows"

-- Example with Employee
data Spec = Programmer | Engineer | Manager deriving (Show)
data Employee = Employee {fName::String, lName::String, spec::Spec} deriving (Show)

calcSalary :: Employee -> Double
calcSalary e = case spec e of
    Programmer -> 1550
    Engineer -> 1600
    Manager -> 1400

getInfo :: Employee -> String
getInfo (Employee f l Programmer) = unwords [f, l, "is a Programmer"]
getInfo (Employee f l Engineer) = unwords [f, l, "is an Engineer"]
getInfo (Employee f l Manager) = unwords [f, l, "is a Manager"]