# Build

## BUILD rv32gcp-ilp32
make clean
./configure --prefix="$PWD/obj-rv32gcp/" --with-arch=rv32gcp --with-abi=ilp32
make -j $(nproc) newlib > log32.log 2> err32.log

## BUILD rv64gcp-lp64d
make clean
./configure --prefix="$PWD/obj-rv64gcp/" --with-arch=rv64gcp --with-abi=lp64d
make -j $(nproc) newlib > log64.log 2> err64.log

# RUN test
test_path="test-p-ext"
rv32=./obj-rv32gcp/bin/riscv32-unknown-elf
rv64=./obj-rv64gcp/bin/riscv64-unknown-elf
# rv32_cflags=-DTARGET_32BIT
# rv64_cflags=-DTARGET_64BIT
test_case_names="kadd
kabs
sra
"
## RV32
echo "======================32BIT====================="
for f in $test_case_names
do
    if [ -f $f.s ]; then
        rm $f.s 
    fi

    $rv32-gcc -S $test_path/$f/$f.c 

    if [ -f $f.s ]; then
        echo "==============[CASE]:$f============="
        grep $f $f.s
    else
        echo "Fail to compile $test_path/$f/$f.c"
    fi
    if [ -f $f.o ]; then
        echo "[ELF HEADER]:"
        $rv32-readelf -h $f.o
    else
        echo "Fail to compile $test_path/$f/$f.c to object file."
    fi
done

## RV64
echo "=====================64BIT====================="
for f in $test_case_names
do
    if [ -f $f.s ]; then
        rm $f.s 
    fi
    if [ -f $f.o ]; then
        rm $f.o 
    fi

    $rv64-gcc -S $test_path/$f/$f.c 
    $rv64-gcc -c $test_path/$f/$f.c 

    if [ -f $f.s ]; then
        echo "==============[CASE]:$f*============="
        grep $f $f.s
    else
        echo "Fail to compile $test_path/$f/$f.c to assembly."
    fi
    
    if [ -f $f.o ]; then
        echo "[ELF HEADER]:"
        $rv64-readelf -h $f.o
    else
        echo "Fail to compile $test_path/$f/$f.c to object file."
    fi
done

