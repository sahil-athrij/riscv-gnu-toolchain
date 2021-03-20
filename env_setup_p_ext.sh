git submodule update --init

gcc_branch=p-ext-dev
binutils_branch=p-ext-dev

cd riscv-gcc
git remote | grep -q p-ext || git remote add p-ext https://github.com/linsinan1995/riscv-gcc.git
git fetch p-ext 
git checkout -f p-ext/$gcc_branch
cd ..

cd riscv-binutils
git remote | grep -q p-ext || git remote add p-ext https://github.com/linsinan1995/riscv-binutils-gdb.git 
git fetch p-ext 
git checkout -f p-ext/$binutils_branch
cd ..

# Temp Fix. See:
#    https://github.com/riscv/riscv-gnu-toolchain/issues/736
cd qemu
git checkout v5.2.0
git submodule update --init --recursive
cd ..
