import Lake
open Lake DSL

package "day_30" where
  -- add package configuration options here

lean_lib «Day30» where
  -- add library configuration options here

@[default_target]
lean_exe "day_30" where
  root := `Main
