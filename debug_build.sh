# !/bin/bash
mkdir debug
cd debug
../configure --with-pydebug
make -j$(nproc)
make test
