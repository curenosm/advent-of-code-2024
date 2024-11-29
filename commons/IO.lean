namespace IO

def toTwoDigitString (x : Nat) : String :=
  if x < 10 then s!"0{x}" else s!"{x}"

/-
def readInputForDay (x : Nat) : IO String :=
  IO.FS.readFile s!"./data/day_{toTwoDigitString x}.txt"
-/

def readInputForDay (x : Nat) : IO String :=
  IO.FS.readFile s!"./data/input.txt"

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"

end IO
