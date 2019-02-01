CXX="/usr/lib/llvm-8/bin/clang++"
common_flags="-Wall -Wextra -g -stdlib=libc++ -fmodules-ts -std=c++17"
${CXX} ${common_flags} --precompile -o module.pcm module.cppm
${CXX} ${common_flags} -o main -fmodule-file=module.pcm main.cpp module.pcm
