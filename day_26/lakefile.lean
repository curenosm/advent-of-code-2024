import Lake
open Lake DSL

package "day_26" where
  -- add package configuration options here

lean_lib «Day26» where
  -- add library configuration options here

@[default_target]
lean_exe "day_26" where
  root := `Main
