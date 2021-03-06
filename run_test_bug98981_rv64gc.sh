##### BUILD default rv64gc
./configure --prefix="$PWD/obj-rv64gc/" 
make -j $(nproc) newlib

##### TEST
$PWD/obj-rv64gc/bin/riscv64-unknown-elf-gcc -c -O3 test-bug98981-rv64/test.c
$PWD/obj-rv64gc/bin/riscv64-unknown-elf-gcc -c -O3 test-bug98981-rv64/test2.c

grep -i -A 20 'sub' test-bug98981-rv64/test*.s