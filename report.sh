make clean
./configure --prefix="$PWD/obj-rv64i_zpn_zprv_zpsf/"  --with-arch=rv64i_zpn_zprv_zpsf --with-abi=lp64
make -j$(nproc) check-gcc-newlib > /dev/null 2>&1
make -j$(nproc) check-binutils-newlib > /dev/null 2>&1
make -j$(nproc) report-gcc-newlib | tee rv64p_gcc.report 2>&1
make -j$(nproc) report-binutils-newlib | tee rv64_binutils.report 2>&1

make clean
./configure --prefix="$PWD/obj-rv32i_zpn_zpsf/"  --with-arch=rv32i_zpn_zpsf --with-abi=ilp32
make -j$(nproc) check-gcc-newlib > /dev/null 2>&1
make -j$(nproc) check-binutils-newlib > /dev/null 2>&1
make -j$(nproc) report-gcc-newlib | tee rv32p_gcc.report 2>&1
make -j$(nproc) report-binutils-newlib | tee rv32p_binutils.report 2>&1

make clean
./configure --prefix="$PWD/obj-rv64gc/"  --with-arch=rv64gc --with-abi=lp64d
make -j$(nproc) check-gcc-newlib > /dev/null 2>&1
make -j$(nproc) check-binutils-newlib > /dev/null 2>&1
make -j$(nproc) report-gcc-newlib | tee  rv64_gcc.report 2>&1
make -j$(nproc) report-binutils-newlib | tee rv64_binutils.report 2>&1

make clean
./configure --prefix="$PWD/obj-rv32gc/"  --with-arch=rv32gc --with-abi=ilp32
make -j$(nproc) check-gcc-newlib > /dev/null 2>&1
make -j$(nproc) check-binutils-newlib  > /dev/null 2>&1
make -j$(nproc) report-gcc-newlib | tee  rv32_gcc.report 2>&1
make -j$(nproc) report-binutils-newlib | tee rv32_binutils.report 2>&1
