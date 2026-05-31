FROM archlinux:base-devel

RUN pacman -Sy
RUN pacman -S --noconfirm cmake
RUN pacman -S --noconfirm ninja
RUN pacman -S --noconfirm llvm
RUN pacman -S --noconfirm clang
RUN pacman -S --noconfirm lld

COPY ./zig /zig
COPY ./stage3/build /zig/build
COPY ./stage4/docker.sh /zig/build
COPY ./libc-test /libc-test

WORKDIR /zig/build

CMD ["./docker.sh"]
