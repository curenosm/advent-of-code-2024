import Lean.Data.HashMap
import Lean.Data.HashSet
import Day02

def insert_n (map: Std.HashMap String Nat) (n : Nat) : Std.HashMap String Nat :=
  map.insert (toString n) n

def main : IO Unit := do
  let mut map : Std.HashMap String Nat := Std.HashMap.empty
  for n in [0:10000000] do
    map := insert_n map n
  IO.print "ran "
  IO.print (toString map.size)
  IO.println " map inserts\n"
  let x <- (readInputData)
  IO.println s!"Input Data: {x}"
  IO.println s!"Hello, {hello}!"
