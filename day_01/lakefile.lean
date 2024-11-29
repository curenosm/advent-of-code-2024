import Lake
open Lake DSL

package "day_01" where
  -- add package configuration options here

lean_lib «Day01» where
  -- add library configuration options here

@[default_target]
lean_exe "day_01" where
  root := `Main
