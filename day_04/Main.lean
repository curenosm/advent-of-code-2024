import Day04


def count_in_line (s : List Char) (word: List Char) : Option Nat := do
  let mut res : Nat := 0
  for i in [0:s.length] do
    if i + 3 < s.length then
      if s[i]! == word[0]! &&
        s[i + 1]! == word[1]! &&
        s[i + 2]! == word[2]! &&
        s[i + 3]! == word[3]! then
        res := res + 1
  res

def count_occurrences (str_lines : List (List Char)) (word : List Char) : Nat :=
  (str_lines.map (λl => match (count_in_line l word) with
    | none => 0
    | some n => n
  )).foldl (· + ·) 0

def horizontal_search_count (matrix : List (List Char)) (word : String) : Nat :=
  count_occurrences matrix word.toList

def vertical_search_count (matrix : List (List Char)) (word : String) : Nat :=
  let column_indices : (List Nat) := List.range (matrix[0]!).length
  let vertical_lines : List (List Char) := column_indices.map (λj =>
    (List.range matrix.length).map (λi => matrix[i]![j]!)
  )
  count_occurrences vertical_lines (word.toList)

def imperative_extraction
  (matrix : List (List Char))
  (starting_position : List Nat)
  (vertical_dir : Int): List Char := Id.run do
  let m := matrix.length
  let n := matrix[0]!.length

  let mut i := starting_position[0]!
  let mut j := starting_position[1]!
  let iter_times := ((n:Int) - j).toNat

  let mut res := []
  for _ in [0:iter_times] do
    let cur_char := matrix[i]![j]!
    i := ((i:Int) + vertical_dir).toNat
    j := j + 1
    res := cur_char::res

  res

#eval imperative_extraction [
  ['.', '.', '.', 'S'],
  ['.', '.', 'A', '.'],
  ['.', 'M', '.', '.'],
  ['X', '.', '.', '.']
] [3, 0] (-1)

def extract_strings_diagonally
  (matrix : List (List Char))
  (starting_positions : List (List Nat))
  (vertical_dir : Int) : List (List Char) :=
  starting_positions.map (λp =>
    let extraction := (imperative_extraction matrix p vertical_dir)
    if vertical_dir == 1 then
      extraction.reverse
    else
      extraction
  )

#eval extract_strings_diagonally [
  ['.', '.', '.', 'S'],
  ['.', '.', 'A', '.'],
  ['.', 'M', '.', '.'],
  ['X', '.', '.', '.']
] [[3, 0], [3, 1]] (-1)

#eval extract_strings_diagonally [
  ['.', '.', '.', 'S'],
  ['.', '.', 'A', '.'],
  ['.', 'M', '.', '.'],
  ['X', '.', '.', '.']
] [[0, 0], [0, 1], [0, 3]] 1

def diagonal_ur_search_count (matrix : List (List Char)) (word : String) : Nat :=
  let m := matrix.length
  let n := matrix[0]!.length

  let starting_positions : List (List Nat) :=
    ((List.range m).map (λi => [i, 0])) ++
    (((List.range n).drop 1).map (λj => [((m:Int) - 1).toNat, j]))

  let diagonal_lines : List (List Char) :=
    extract_strings_diagonally matrix starting_positions (-1)
  count_occurrences diagonal_lines (word.toList)

#eval diagonal_ur_search_count [
  ['.', '.', '.', 'S'],
  ['.', '.', 'A', '.'],
  ['.', 'M', '.', '.'],
  ['X', '.', '.', '.']
] "XMAS"

def diagonal_dr_search_count (matrix : List (List Char)) (word : String) : Nat :=
  let m := matrix.length
  let n := matrix[0]!.length

  let starting_positions : List (List Nat) :=
    (((List.range m).drop 1).map (λi => [i, 0])) ++
    ((List.range n).map (λj => [0, j]))

  let diagonal_lines : List (List Char) :=
    extract_strings_diagonally matrix starting_positions 1
  count_occurrences diagonal_lines (word.toList)

#eval diagonal_dr_search_count [
  ['X', 'S', '.', '.', '.'],
  ['X', 'M', 'A', '.', '.'],
  ['.', 'M', 'A', 'M', '.'],
  ['.', '.', 'A', 'S', 'X'],
  ['.', '.', '.', 'S', '.'],
] "XMAS"

def main : IO Unit := do
  let input_data <- (readInputData)
  let data_lines := lines input_data
  let matrix := data_lines.map String.toList
  -- IO.println s!"{matrix}"
  let count_horizontal := horizontal_search_count matrix "XMAS"
  IO.println s!"horizontal: {count_horizontal}"
  let count_horizontal_rev := horizontal_search_count matrix "SAMX"
  IO.println s!"horizontal_rev :{count_horizontal_rev}"
  let count_vertical := vertical_search_count matrix "XMAS"
  IO.println s!"vertical :{count_vertical}"
  let count_vertical_rev := vertical_search_count matrix "SAMX"
  IO.println s!"vertical_rev :{count_vertical_rev}"
  let count_diagonal_ur := diagonal_ur_search_count matrix "XMAS"
  IO.println s!"diagonal :{count_diagonal_ur}"
  let count_diagonal_ur_rev := diagonal_ur_search_count matrix "SAMX"
  IO.println s!"diagonal_rev :{count_diagonal_ur_rev}"
  let count_diagonal_dr := diagonal_dr_search_count matrix "XMAS"
  IO.println s!"diagonal :{count_diagonal_dr}"
  let count_diagonal_dr_rev := diagonal_dr_search_count matrix "SAMX"
  IO.println s!"diagonal_rev :{count_diagonal_dr_rev}"
  let result := count_horizontal + count_horizontal_rev +
    count_vertical + count_vertical_rev +
    count_diagonal_ur + count_diagonal_ur_rev +
    count_diagonal_dr + count_diagonal_dr_rev
  IO.println s!"Result: {result}"
