import Lake
open Lake DSL

package "day_24" where
  -- add package configuration options here

lean_lib «Day24» where
  -- add library configuration options here

@[default_target]
lean_exe "day_24" where
  root := `Main
