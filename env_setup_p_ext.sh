git submodule update --init

cd riscv-gcc
git submodule update
git checkout p-ext-dev
cd ..

cd riscv-binutils
git checkout riscv-binutils-2.35
cd ..

# Temp Fix. See:
#    https://github.com/riscv/riscv-gnu-toolchain/issues/736
cd qemu
git checkout v5.2.0
git submodule update --init --recursive
cd ..