#!/bin/sh
#This scripts should only be run from inside docker container

./stage3/bin/zig build -p stage4 -Denable-llvm -Dno-lib
./stage3/bin/zig build test-libc-nsz -Dlibc-test-path=../../libc-test -Dtest-target-filter=x86_64-linux-musl -Dtest-filter=exp10 --summary line
