##### BUILD default rv32ec-ilp32e
./configure --prefix="$PWD/obj-rv32ec/" --with-arch=rv32ec --with-abi=ilp32e
make -j $(nproc) check-gcc-newlib
make report-gcc-newlib