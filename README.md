# Installation of OCAML on MacOS

Author: CongVM

## Introduction

```
"OCaml is a general purpose programming language with an emphasis on expressiveness and safety. Developed for more than 20 years at Inria by a group of leading researchers, it has an advanced type system that helps catch your mistakes without getting in your way. It's used in environments where a single mistake can cost millions and speed matters, is supported by an active community, and has a rich set of libraries and development tools." -  ocaml.org
```

OCAML has been using in the course of Types and Programming languages, therefore, to do homeworks, you have to install OCAML.

## Installation

```bash
# Required
brew install ocaml
brew install opam # package manager

# Optional 
brew install ocamlbuild # executive builder

# Init ocaml package manager
opam init

# Install useful packages
opam install base core ocamlfind
```

Then you need to manually load packages by inserting the below script in file `~/.ocamlinit`

```ocaml
#use  "topfind";                                                           
#thread;;
#camlp4o;;
#require "core.top";;
#require "core.syntax";;
 
let () =
   try Topdirs.dir_directory (Sys.getenv "OCAML_TOPLEVEL_PATH")
   with Not_found -> ()
;;
```

```bash
# Let ocaml reload all packages from its environment
# The environment could be selected/create/delete/etc
# To automatically reload after opening the terminal/shell, 
# You can add this line in ~/.zshrc or ~/.bashrc depending 
# on your system.
eval $(opam env)
```

## How to Run

OCAML supports Interactive-Read-Eval-Print Loop, so you can type `ocaml` and then type your code, etc.

```bash
ocaml 
```

Additionally, you can write code in file with extension `.ml`

```bash
# To run
ocaml <filename>.ml

# To compile into executive file
# The compiler automatically finds a file with name <filename>.ml in working directory
# Then compile this file and its dependencies into <filename>.native
ocamlbuild filename.native 

```

## Issues

Sometimes, you cannot install packages using opam on MacOS because of library linking confliction/missing.
It is necessary to reset `xcode`. It works in some cases and I hope it works in your case as well.

```bash
sudo xcode-select --reset
```

## References

[1] https://dev.realworldocaml.org/guided-tour.html \
[2] http://www.cs.columbia.edu/~sedwards/classes/2018/4115-fall/ocaml.pdf \
[3] https://ocaml.org/docs/install.html 


