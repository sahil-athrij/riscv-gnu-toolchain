git submodule update --init

cd riscv-gcc
git checkout riscv-gcc-10.2.0
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

#### MAIN SCRIIPT FOR TESTING
#./run_test_pr84877_rv32_ilp32e.sh
./run_test_multilib.sh
#./run_test_bug98981_rv64gc.sh

