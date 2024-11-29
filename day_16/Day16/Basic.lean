def hello := "world"

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"
