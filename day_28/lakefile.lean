import Lake
open Lake DSL

package "day_28" where
  -- add package configuration options here

lean_lib «Day28» where
  -- add library configuration options here

@[default_target]
lean_exe "day_28" where
  root := `Main
