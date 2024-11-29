import Lake
open Lake DSL

package "day_11" where
  -- add package configuration options here

lean_lib «Day11» where
  -- add library configuration options here

@[default_target]
lean_exe "day_11" where
  root := `Main
