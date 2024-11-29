import Lake
open Lake DSL

package "day_07" where
  -- add package configuration options here

lean_lib «Day07» where
  -- add library configuration options here

@[default_target]
lean_exe "day_07" where
  root := `Main
