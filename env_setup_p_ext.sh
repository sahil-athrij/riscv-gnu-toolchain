git submodule update --init
git submodule update --recursive --remote
./report.sh
gcc_branch=riscv-gcc-experiment-p-ext
binutils_branch=riscv-binutils-experiment-p-ext

cd riscv-gcc
git branch
git checkout $gcc_branch 
cd ..

cd riscv-binutils
git branch
git checkout $binutils_branch 
cd ..
