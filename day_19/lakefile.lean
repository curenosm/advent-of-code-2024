import Lake
open Lake DSL

package "day_19" where
  -- add package configuration options here

lean_lib «Day19» where
  -- add library configuration options here

@[default_target]
lean_exe "day_19" where
  root := `Main
