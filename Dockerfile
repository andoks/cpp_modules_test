FROM ubuntu:artful-20180412

# install apt-utils to ensure clang is set up
# correctly
RUN apt-get update              \
    && apt-get install -y       \
    apt-utils                   

# set up apt for installing clang from upstream LLVM repo
RUN apt-get update              \
    && apt-get install -y       \
    wget
RUN wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|apt-key add -
COPY llvm.list /etc/apt/sources.list.d/llvm.list

# install clang/llvm from upstream repo (+ necessary build tools)
RUN apt-get update              \
    && apt-get install -y       \
        --no-install-recommends \
        clang-8                 \
        libc++-8-dev            \
        libc++-helpers          \
        vim                     \
        git

# ensure clang tools work
RUN update-alternatives --install /usr/lib/llvm-8/lib/libc++abi.so libc++abi /usr/lib/llvm-8/lib/libc++abi.so.1  1
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/lib/llvm-8/bin/clang++ 1

WORKDIR /workdir
COPY ./ src
WORKDIR /workdir/src
ENV LD_LIBRARY_PATH=/usr/lib/llvm-8/lib
RUN ["./build.bash"]
CMD ["./main"]
