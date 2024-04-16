mkdir build
find src/ | grep ".asm" | awk '{ print $1" -f elf64" }' | xargs -L1 nasm 
gcc $(find src/ | grep "\.o") -o build/target -no-pie 
find src/ | grep "\.o" | xargs -L1 rm 