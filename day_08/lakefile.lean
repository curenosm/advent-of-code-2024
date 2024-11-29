import Lake
open Lake DSL

package "day_08" where
  -- add package configuration options here

lean_lib «Day08» where
  -- add library configuration options here

@[default_target]
lean_exe "day_08" where
  root := `Main
