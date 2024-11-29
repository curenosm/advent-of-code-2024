import Lake
open Lake DSL

package "day_17" where
  -- add package configuration options here

lean_lib «Day17» where
  -- add library configuration options here

@[default_target]
lean_exe "day_17" where
  root := `Main
