# MXE Docker environment

Example building yosys:

```
git clone https://github.com/mmicko/mxe-docker
cd mxe-docker
git clone https://github.com/cliffordwolf/yosys.git yosys-win32
cd yosys-win32
../run_mxe make config-mxe
../run_mxe make -j$(nproc) mxebin
```
