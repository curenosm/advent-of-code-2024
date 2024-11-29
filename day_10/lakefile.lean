import Lake
open Lake DSL

package "day_10" where
  -- add package configuration options here

lean_lib «Day10» where
  -- add library configuration options here

@[default_target]
lean_exe "day_10" where
  root := `Main
