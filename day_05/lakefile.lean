import Lake
open Lake DSL

package "day_05" where
  -- add package configuration options here

lean_lib «Day05» where
  -- add library configuration options here

@[default_target]
lean_exe "day_05" where
  root := `Main
