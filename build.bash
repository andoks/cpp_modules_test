CXX="clang++-libc++"
common_flags="-Wall -Wextra -g -fmodules-ts -std=c++17"
${CXX} ${common_flags} --precompile -o module.pcm module.cppm
${CXX} ${common_flags} -o main -fmodule-file=module.pcm main.cpp module.pcm
