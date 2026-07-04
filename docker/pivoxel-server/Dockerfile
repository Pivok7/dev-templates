FROM alpine:3.24

RUN apk add \
    zig git \
    --repository=https://dl-cdn.alpinelinux.org/alpine/v3.24/community

WORKDIR /app

RUN git clone --depth=1 https://codeberg.org/Pivok/PiVoxel
WORKDIR /app/PiVoxel

RUN zig build server -Doptimize=ReleaseSafe

EXPOSE 2137

CMD ["./zig-out/bin/pivoxel-server"]
