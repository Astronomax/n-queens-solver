# n-queens-solver
[![Haskell CI](https://github.com/Astronomax/n-queens-solver/actions/workflows/haskell.yml/badge.svg)](https://github.com/Astronomax/n-queens-solver/actions/workflows/haskell.yml)

A simple solver of n-queens problem.
## Usage

In the project root folder run the following to build the project:
```console
$ stack update
$ stack build
```

Then run the solver with exactly one integer argument - board size:
```console
$ stack run -- 8
|.......Q|
|.Q......|
|....Q...|
|..Q.....|
|Q.......|
|......Q.|
|...Q....|
|.....Q..|
```
If the problem has no solution for a given board size, you will receive the following:
```
$ stack run -- 2
The problem has no solutions
```
To test the project run the following command:
```console
$ stack test
```
