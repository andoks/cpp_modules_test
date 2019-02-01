using clang++ v6:
- module _must_ be suffixed '.cppm' for clang++ to treat it as a module
- including and using std::string as function parameter in modules' function
  errored compiler in some template code
- including iostream in module and then couting input parameter sigsegved'
using clang++v8:
- still got errors: "/usr/bin/ld: cannot find -lc++abi"
