import Lake
open Lake DSL

package "day_16" where
  -- add package configuration options here

lean_lib «Day16» where
  -- add library configuration options here

@[default_target]
lean_exe "day_16" where
  root := `Main
