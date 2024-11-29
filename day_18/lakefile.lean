import Lake
open Lake DSL

package "day_18" where
  -- add package configuration options here

lean_lib «Day18» where
  -- add library configuration options here

@[default_target]
lean_exe "day_18" where
  root := `Main
