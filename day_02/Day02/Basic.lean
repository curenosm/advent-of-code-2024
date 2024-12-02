/-
import Lean.Data.HashMap
import Lean.Data.HashSet

open Lean (HashMap)
open Lean (HashSet)
-/

structure Report where
  levels: List Int
deriving Repr, Inhabited

def hello := "world"

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"

def lines (s : String) : List String :=
  (s.splitOn "\n").filter (λl => !l.isEmpty)

def String.parseIntList (s : String) : List Int :=
  ((s.trim.splitOn " ").map String.toInt?).filterMap id

def Report.fromString! (s: String) : Report :=
  { levels := s.parseIntList }

def Report.isStrictlyIncreasing (levels : List Int) : Bool := match levels with
  | [] => true
  | [_] => true
  | l₁::l₂::ls => l₁ < l₂ && Report.isStrictlyIncreasing (l₂::ls)

def Report.isStrictlyDecreasing (levels : List Int) : Bool := match levels with
  | [] => true
  | [_] => true
  | l₁::l₂::ls => l₁ > l₂ && Report.isStrictlyDecreasing (l₂::ls)

def Report.changesGradually (levels: List Int) (min : Nat) (max : Nat) : Bool :=
  match levels with
  | [] => true
  | [_] => true
  | l₁::l₂::ls =>
    let diff := (l₂ - l₁).natAbs
    min <= diff && diff <= max && (Report.changesGradually (l₂::ls) min max)
