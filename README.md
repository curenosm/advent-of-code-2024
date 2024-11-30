# Advent of Code 2024

## Requirements

- `elan`: `3.1.1`
- `lean`: `4.13.0`
- `lake`: `5.0.0`

## Compilation Instructions

### Linux / Mac OS / Windows

```bash
cd day_<day_number>
lake build
```

## Execution Instructions

### Linux / Mac OS

```bash
cd day_<day_number>
./.lake/build/bin/day_<day_number>
```

### Windows

```powershell
cd day_<day_number>
.\.lake\build\bin\day_<day_number>.exe
```

## Fixing Common Issues

If you get errors like this:

```bash
error: .\lakefile.lean:4:7: error: unexpected token; expected identifier
```

Probably you need to set the toolchains for the given package:

```bash
elan override set 4.13.0
```
