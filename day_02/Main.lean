import Day02

def main : IO Unit := do
  let input <- (readInputData)
  let reportLines := lines input
  let reports := reportLines.map (λr => Report.fromString! r)
  let valid := reports.filter (λr =>
    Report.isStrictlyIncreasing r.levels
    || Report.isStrictlyDecreasing r.levels
  )
  let gradual := valid.filter (λr => Report.changesGradually r.levels 1 3)
  let result := gradual.length
  IO.println s!"Result: {result}"
