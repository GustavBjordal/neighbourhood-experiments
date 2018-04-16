# Software

## fzn-oscar-cbls

## MiniZinc

# Disclaimer

Filenames and syntax has changed since running the experiments, 
but everything remains logaically equivallent.
However, for complete reproducibility, old filenames and syntax has been
preserved in this repository.



## Changes

We here list what things used to be named, i.e., what they are
called in this repository.

### Filenames

- `local-search.mzn` is here `ls-annotation.mzn`

### Syntax

- `moves` is here `from`
- `ensuring` is here `ensure`
- `initially` is here `initialize`
- `union` is here `\/`
-  `use_neighbourhood(ann: neighbour)` is here `neighbourhood_and(array [int] of ann: neighbourhoods)`
-  `void` is here `ls_dummy`
-  `defines_generator` is here `ls_defines_generator`

#### Note

See also `steelmill/README.md`.
