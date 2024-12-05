def hello := "world"

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"

def lines (s : String) : List String :=
  (s.splitOn "\n").filter (λl => !l.isEmpty)
