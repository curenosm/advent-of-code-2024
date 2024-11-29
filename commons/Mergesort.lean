def List.split (as : List α) : List α × List α :=
  match as with
  | [] => ([], [])
  | [a] => ([a], [])
  | a :: b :: as =>
    let (as, bs) := split as
    (a :: as, b :: bs)

@[simp] def List.atLeast2 (as : List α) : Bool :=
  match as with
  | [] => false
  | [_] => false
  | _::_::_ => true

theorem List.length_split_of_atLeast2 {as : List α} (h : as.atLeast2) : as.split.1.length < as.length ∧ as.split.2.length < as.length := by
  match as with
  | [] => simp at h
  | [_] => simp at h
  | [_, _] => simp (config := { decide := true }) [split]
  | [_, _, _] => simp (config := { decide := true }) [split]
  | a::b::c::d::as =>
    have : (c::d::as).atLeast2 := by simp_arith
    have ih := length_split_of_atLeast2 this
    simp_arith [split] at ih |-
    have ⟨ih₁, ih₂⟩ := ih
    exact ⟨Nat.le_trans ih₁ (by simp_arith), Nat.le_trans ih₂ (by simp_arith)⟩
