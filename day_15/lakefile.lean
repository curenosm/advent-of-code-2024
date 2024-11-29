import Lake
open Lake DSL

package "day_15" where
  -- add package configuration options here

lean_lib «Day15» where
  -- add library configuration options here

@[default_target]
lean_exe "day_15" where
  root := `Main
