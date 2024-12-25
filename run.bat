md bin
nasm -f bin -o bin\b1.bin boot\stage1.asm
nasm -f bin -o bin/b2.bin boot/stage2.asm
copy /v /y /b bin\b1.bin + /b bin\b2.bin bin\boot.bin /b
del /F /Q "bin\b1.bin"
del /F /Q "bin\b2.bin"
qemu-system-x86_64 -drive format=raw,file=bin/boot.bin
