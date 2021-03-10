##### BUILD default rv64gc
./configure --prefix="$PWD/obj-rv64gc/" 
make -j $(nproc) newlib

##### TEST
if [ -f "*.s" ]; then
   rm *.s 
fi

obj-rv64gc/bin/riscv64-unknown-elf-gcc -S -O3 test-bug98981-rv64/test.c
obj-rv64gc/bin/riscv64-unknown-elf-gcc -S -O3 test-bug98981-rv64/test2.c

grep -i -A 20 'test' test*.s
