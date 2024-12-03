import Day03
import Regex
open Regex

def main : IO Unit := do
  let input_data <- (readInputData)
  let re := regex% r"mul\((\p{Nd}+),(\p{Nd}+)\)"
  let captures := Regex.all_captures input_data re
  let groups := captures.map (λc => [
    ((c.groups[0]!.getD "0").toString |> String.parseIntList)[0]!,
    ((c.groups[1]!.getD "0").toString |> String.parseIntList)[0]!
  ])
  let products := (groups.map (λg => g[0]! * g[1]!)).toList
  let result := products.foldl (· + ·) 0
  IO.println s!"Result: {result}"
