Inspired by talk of Boris Kolpackov "Building C++ Modules" [CppCon 2017][1]

Notes:
- module _must_ be suffixed '.cppm' for clang++ to treat it as a module

Fixing it:
use llvm upstream compiler (not using upstream libc++ as this required
uninstalling current libc++ which was used by discord):
1. add repository by
   sudo echo 'deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main
   deb-src http://apt.llvm.org/bionic/ llvm-toolchain-bionic-8 main' > /etc/apt/sources.list.d/clang.list
2. add llvm key by
   wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
3. sudo apt-get update && sudo apt-get upgrade
4. install clang++ by:
   sudo apt-get install clang-8 libc++-dev

use "compiler" "clang++-libc++" which wraps using libc++. However two symlinks
are missing for it to work. Add them by:
1. clang++-libc++ complaining about missing clang++: 'sudo update-alternatives
--install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 1'
2. ld complaining about missing libc++abi: 'sudo update-alternatives --install
/usr/lib/x86_64-linux-gnu/libc++abi.so libc++abi
/usr/lib/x86_64-linux-gnu/libc++abi.so.1 1'

[1]: https://www.youtube.com/watch?v=E8EbDcLQAoc&feature=youtu.be
