./configure --prefix="$PWD/obj-rv64gc-multilib/" --enable-multilib

# you can use make -j* to make speed up
make -j $(nproc) check-gcc-newlib
make report-gcc-newlib

