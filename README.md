# Software

## fzn-oscar-cbls

All experiments were run under fzn-oscar-cbls version as of 18.04.2018 - [http://user.it.uu.se/~gusbj192/fzn-oscar-cbls/versions/oscar-cbls-flatzinc_18_04_2018.zip]

## MiniZinc

The modified version of the MiniZinc compiler used can be found at [https://github.com/GustavBjordal/libminizinc/tree/feature/ls-annotation].
For the experiments, the version as of commit [a96548edda68c9a8d52934ae6c191d864ec6ccb8](https://github.com/GustavBjordal/libminizinc/tree/a96548edda68c9a8d52934ae6c191d864ec6ccb8) has been used.

# Disclaimer

Filenames and syntax has changed since running the experiments, 
but changes are only syntactic.
However, for complete reproducibility, old filenames and syntax has been
preserved in this repository.

## Temporary Workarounds

Currently one cannot use `a = b` or `a == b` to express equality in pre- or post-conditions. 
Instead one has to use `int_eq(a,b)`.

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
