git submodule update --init

gcc_branch=p-ext-dev
binutils_branch=p-ext-dev

cd riscv-gcc
git remote | grep -q $gcc_branch || git remote add $gcc_branch https://github.com/linsinan1995/riscv-gcc.git
git fetch $gcc_branch
git checkout -f $gcc_branch/$gcc_branch
cd ..

cd riscv-binutils
git remote | grep -q $binutils_branch || git remote add $binutils_branch https://github.com/linsinan1995/riscv-binutils-gdb.git 
git fetch $binutils_branch
git checkout -f $binutils_branch/$binutils_branch
cd ..

# Temp Fix. See:
#    https://github.com/riscv/riscv-gnu-toolchain/issues/736
cd qemu
git checkout v5.2.0
git submodule update --init --recursive
cd ..
