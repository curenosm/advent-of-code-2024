import Day01

def main : IO Unit := do
  let x <- (readInputData)
  let str := (lines x)
  let first := List.mergeSort (str.map (λs => (Pair.fromString! s).first))
  let second := List.mergeSort (str.map (λs => (Pair.fromString! s).second))
  let mut sum : Int := 0
  for i in [0:first.length] do
    let cur := (second[i]! - first[i]!).natAbs
    sum := sum + cur
  IO.println s!"Result: {sum}"
-- #eval (main)
