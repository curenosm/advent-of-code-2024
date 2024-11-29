import Lake
open Lake DSL

package "day_09" where
  -- add package configuration options here

lean_lib «Day09» where
  -- add library configuration options here

@[default_target]
lean_exe "day_09" where
  root := `Main
