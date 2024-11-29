import Lake
open Lake DSL

package "day_27" where
  -- add package configuration options here

lean_lib «Day27» where
  -- add library configuration options here

@[default_target]
lean_exe "day_27" where
  root := `Main
