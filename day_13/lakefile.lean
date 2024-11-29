import Lake
open Lake DSL

package "day_13" where
  -- add package configuration options here

lean_lib «Day13» where
  -- add library configuration options here

@[default_target]
lean_exe "day_13" where
  root := `Main
