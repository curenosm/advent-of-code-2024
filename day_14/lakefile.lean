import Lake
open Lake DSL

package "day_14" where
  -- add package configuration options here

lean_lib «Day14» where
  -- add library configuration options here

@[default_target]
lean_exe "day_14" where
  root := `Main
