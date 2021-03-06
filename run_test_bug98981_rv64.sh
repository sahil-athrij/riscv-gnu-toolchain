##### BUILD default rv64gc
./configure --prefix="$PWD/obj-rv64gc/" 
make -j $(nproc) newlib

##### TEST
riscv64-unknown-elf-gcc -c -O3 test-bug98981-rv64/test.c
riscv64-unknown-elf-gcc -c -O3 test-bug98981-rv64/test2.c

grep -i -A 20 'sub' test-bug98981-rv64/test*.s