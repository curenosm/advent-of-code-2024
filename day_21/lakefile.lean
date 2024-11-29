import Lake
open Lake DSL

package "day_21" where
  -- add package configuration options here

lean_lib «Day21» where
  -- add library configuration options here

@[default_target]
lean_exe "day_21" where
  root := `Main
