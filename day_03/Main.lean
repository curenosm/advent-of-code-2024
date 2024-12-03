import Day03
import Regex
open Regex

def part_1 : IO Int := do
  let input_data <- (readInputData)
  let re := regex% r"mul\((\p{Nd}+),(\p{Nd}+)\)"
  let captures := Regex.all_captures input_data re
  let groups := captures.map (λc => [
    ((c.groups[0]!.getD "0").toString |> String.parseIntList)[0]!,
    ((c.groups[1]!.getD "0").toString |> String.parseIntList)[0]!
  ])
  let products := (groups.map (λg => g[0]! * g[1]!)).toList
  let result := products.foldl (· + ·) 0
  return result

def part_2 : IO Int := do
  let input_data <- (readInputData)
  let re := regex% r"(mul\((\p{Nd}+),(\p{Nd}+)\)|do\(\)|don't\(\))"
  let captures := (Regex.all_captures input_data re).toList

  let mut groups : List (List Int) := []
  let mut insert_next := true

  for n in captures do
    let type := (n.groups[0]!.getD "0").toString
    match type with
    | "do()" => insert_next := true
    | "don't()" => insert_next := false
    | _ => do
      let cur := [
        ((n.groups[1]!.getD "0").toString |> String.parseIntList)[0]!,
        ((n.groups[2]!.getD "0").toString |> String.parseIntList)[0]!
      ]
      if insert_next then groups := cur::groups

  let products := groups.map (λg => g[0]! * g[1]!)
  let result := products.foldl (· + ·) 0
  return result

def main : IO Unit := do
  -- let result <- (part_1)
  let result <- (part_2)
  IO.println s!"Result: {result}"
