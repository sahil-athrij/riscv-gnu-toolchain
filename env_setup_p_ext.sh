git submodule update --init

gcc_branch=p-ext-dev
binutils_branch=p-ext-dev

cd riscv-gcc
git branch
git checkout  $gcc_branch 
git pull
cd ..

cd riscv-binutils
git branch
git checkout $binutils_branch 
git pull
cd ..

# Temp Fix. See:
#    https://github.com/riscv/riscv-gnu-toolchain/issues/736
cd qemu
git checkout v5.2.0
git submodule update --init --recursive
cd ..
