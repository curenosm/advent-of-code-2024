import Lake
open Lake DSL

package "day_23" where
  -- add package configuration options here

lean_lib «Day23» where
  -- add library configuration options here

@[default_target]
lean_exe "day_23" where
  root := `Main
