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