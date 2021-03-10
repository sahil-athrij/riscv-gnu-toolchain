##### BUILD rv32gc-ilp32
./configure --prefix="$PWD/obj-rv32ec/" --with-arch=rv32gc --with-abi=ilp32
make -j $(nproc) newlib

##### RUN test
if [ -f "kaddh.s" ]; then
   rm kaddh.s 
fi
./obj-rv32ec/bin/riscv32-unknown-elf-gcc -S test-p-ext/kaddh/kaddh.c 

if [ -f "kaddh.s" ]; then
   grep -i -A 10 'kaddh' kaddh.s
else
   echo "Fail to compile test-p-ext/kaddh/kaddh.c"
fi