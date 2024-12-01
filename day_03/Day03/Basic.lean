def hello := "world"

structure Balls where
  red : Nat := 0
  green : Nat := 0
  blue : Nat := 0
deriving Repr, Inhabited

structure Game where
  id : Nat
  draws : List Balls
deriving Repr, Inhabited

def readInputData : IO String :=
  IO.FS.readFile s!"./data/input.txt"

instance : Max Balls where
  max b1 b2 := {
    red := max b1.red b2.red,
    green := max b1.green b2.green,
    blue := max b1.blue b2.blue
  }

instance : Add Balls where
  add b1 b2 := {
    red := b1.red + b2.red,
    green := b1.green + b2.green,
    blue := b1.blue + b2.blue
  }

def Balls.singleFromString! (s : String) : Balls :=
  match (s.dropWhile (λa => a == ' ')).splitOn " " with
  | c::["red"] => { red := c.toNat! }
  | c::["blue"] => { blue := c.toNat! }
  | c::["green"] => { green := c.toNat! }
  | _ => panic s!"{s} invalid"

def Balls.fromString! (s : String) : Balls :=
  ((s.splitOn ",").map Balls.singleFromString!).foldl (λa b => a + b) {}

def Game.fromString! (s : String) : Game :=
  match s.splitOn ":" with
  | game::[balls] => match game.splitOn " " with
    | "Game"::[num] => { id := num.toNat!, draws := (balls.splitOn ";").map Balls.fromString! }
    | _ => panic! s!"{game} invalid game"
  | _ => panic s!"{s} invalid line (multiple colons?)"

-- #eval Balls.fromString! "2 red, 2 blue, 2 green"

def List.split (as : List α) : List α × List α :=
  match as with
  | [] => ([], [])
  | [a] => ([a], [])
  | a::b::as =>
    let (as, bs) := split as
    (a :: as, b ::bs)

@[simp] def List.atLeast2 (as : List α) : Bool :=
  match as with
  | [] => false
  | [_] => false
  | _::_::_ => true
