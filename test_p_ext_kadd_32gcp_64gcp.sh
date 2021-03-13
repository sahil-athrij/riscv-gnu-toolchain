##### BUILD rv32gcp-ilp32
make clean
./configure --prefix="$PWD/obj-rv32gcp/" --with-arch=rv32gcp --with-abi=ilp32
make -j $(nproc) newlib > log32.log 2> err32.log

##### BUILD rv64gcp-lp64d
make clean
./configure --prefix="$PWD/obj-rv64gcp/" --with-arch=rv64gcp --with-abi=lp64d
make -j $(nproc) newlib > log64.log 2> err64.log

##### RUN test
if [ -f "kadd.s" ]; then
   rm kadd.s 
fi
./obj-rv32gcp/bin/riscv32-unknown-elf-gcc -DTARGET_32BIT -S test-p-ext/kadd/kadd.c 

if [ -f "kadd.s" ]; then
    echo "=======32BIT======"
    grep -i -A 10 'kadd' kadd.s
else
    echo "Fail to compile test-p-ext/kadd/kadd.c"
fi

### RV64

if [ -f "kadd.s" ]; then
   rm kadd.s 
fi
./obj-rv64gcp/bin/riscv64-unknown-elf-gcc -DTARGET_64BIT -S test-p-ext/kadd/kadd.c 

if [ -f "kadd.s" ]; then
    echo "=======64BIT======"
    grep -i -A 10 'kadd' kadd.s
else
    echo "Fail to compile test-p-ext/kadd/kadd.c"
fi
