import Lake
open Lake DSL

package "day_02" where
  -- add package configuration options here

lean_lib «Day02» where
  -- add library configuration options here

@[default_target]
lean_exe "day_02" where
  root := `Main
