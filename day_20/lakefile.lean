import Lake
open Lake DSL

package "day_20" where
  -- add package configuration options here

lean_lib «Day20» where
  -- add library configuration options here

@[default_target]
lean_exe "day_20" where
  root := `Main
