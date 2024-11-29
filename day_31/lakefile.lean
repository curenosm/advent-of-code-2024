import Lake
open Lake DSL

package "day_31" where
  -- add package configuration options here

lean_lib «Day31» where
  -- add library configuration options here

@[default_target]
lean_exe "day_31" where
  root := `Main
