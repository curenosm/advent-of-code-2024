import Lake
open Lake DSL

package "day_25" where
  -- add package configuration options here

lean_lib «Day25» where
  -- add library configuration options here

@[default_target]
lean_exe "day_25" where
  root := `Main
