FROM archlinux:base-devel

RUN pacman -Sy
RUN pacman -S --noconfirm cmake
RUN pacman -S --noconfirm ninja
RUN pacman -S --noconfirm llvm
RUN pacman -S --noconfirm clang
RUN pacman -S --noconfirm lld

COPY ./zig /zig
RUN mkdir /zig/build

WORKDIR /zig/build

CMD ["/bin/sh", "-c", "cmake .. -GNinja -DZIG_NO_LIB=ON -DCMAKE_BUILD_TYPE=Release; ninja"]
