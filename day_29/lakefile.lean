import Lake
open Lake DSL

package "day_29" where
  -- add package configuration options here

lean_lib «Day29» where
  -- add library configuration options here

@[default_target]
lean_exe "day_29" where
  root := `Main
