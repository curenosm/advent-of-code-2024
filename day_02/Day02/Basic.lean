import Lean.Data.HashMap
import Lean.Data.HashSet

def hello := "world"

def Char.isSymbol (c : Char) : Bool :=
  !c.isDigit && c != '.'

def String.partition (s : String) (n : Nat) : String × String :=
  (s.take n, s.drop n)

def String.partitionUntil (s : String) (f : Char -> Bool) : String × String :=
  let rest := s.dropWhile (λx => !f x)
  (s.take (s.length - rest.length), rest)

def String.partitionWhile (s : String) (f : Char -> Bool) : String × String :=
  let rest := s.dropWhile f
  (s.take (s.length - rest.length), rest) 

def String.last! (s : String) : Char :=
  (String.mk s.toList.reverse).get! 0

structure ThreeLines where
  prev : String
  curr : String
  nect : String
deriving Repr, Inhabited

def ThreeLines.isEmpty (t : ThreeLines) : Bool :=
  t.curr.isEmpty

open Lean (HashMap)
open Lean (HashSet)

def Coordinates := HashMap (Int × Int) Nat

def Coordinates.addCoords (c : Coordinates) (num : Nat) (y : Nat) (xStart : Nat) (toAdd : Nat) : Coordinates :=
  match toAdd with
  | 0 => c
  | Nat.succ toAdd =>
  Coordinates.addCoords (c.insert (xStart, y) num) num y (xStart + 1) toAdd

partial def numberCoordinatesInLine (l : String) (y : Nat) (x : Nat) (c: Coordinates) : Coordinates :=
  if l.isEmpty then c else 
  let (prev, l) := l.partitionUntil Char.isDigit
  if l.isEmpty then c else
  let x := x + prev.length
  let (numS, after) := l.partitionWhile Char.isDigit
  let num := numS.toNat!
  numberCoordinatesInLine after y (x + numS.length) (c.addCoords num y x numS.length)

def adjacentCoords (as : (Int × Int)) : List (Int × Int) :=
  [(as.1 - 1, as.2 - 1),
   (as.1, as.2 - 1),
   (as.1 - 1, as.2),
   (as.1 + 1, as.2),
   (as.1 + 1, as.2 + 1),
   (as.1, as.2 + 1),
   (as.1 - 1, as.2 + 1),
   (as.1 + 1, as.2 - 1)] 

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"

