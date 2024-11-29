import Lake
open Lake DSL

package "day_22" where
  -- add package configuration options here

lean_lib «Day22» where
  -- add library configuration options here

@[default_target]
lean_exe "day_22" where
  root := `Main
