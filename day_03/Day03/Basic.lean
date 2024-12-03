def hello := "world"

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"

def String.parseIntList (s : String) : List Int :=
  ((s.trim.splitOn ",").map String.toInt?).filterMap id
