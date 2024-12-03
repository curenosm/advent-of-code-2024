import Lake
open Lake DSL
require Regex from git "https://github.com/bergmannjg/regex" @ "main"

package "day_03" where
  -- add package configuration options here

lean_lib «Day03» where
  -- add library configuration options here

@[default_target]
lean_exe "day_03" where
  root := `Main
