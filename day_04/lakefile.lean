import Lake
open Lake DSL

package "day_04" where
  -- add package configuration options here

lean_lib «Day04» where
  -- add library configuration options here

@[default_target]
lean_exe "day_04" where
  root := `Main
