structure Pair where
  first : Int
  second : Int
deriving Repr, Inhabited

def lines (s : String) : List String :=
  (s.splitOn "\n").filter (λl => !l.isEmpty)

def readInputData : IO String := IO.FS.readFile s!"./data/input.txt"

def Pair.fromString! (s: String) : Pair :=
  match (s.splitOn " ").filter (λn => !n.isEmpty) with
  | first::second::[] => { first := first.toInt!, second := second.toInt! }
  | _ => panic s!"{s} invalid"
