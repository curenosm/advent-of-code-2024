import Lake
open Lake DSL

package "day_12" where
  -- add package configuration options here

lean_lib «Day12» where
  -- add library configuration options here

@[default_target]
lean_exe "day_12" where
  root := `Main
