import Lake
open Lake DSL

package "day_06" where
  -- add package configuration options here

lean_lib «Day06» where
  -- add library configuration options here

@[default_target]
lean_exe "day_06" where
  root := `Main
