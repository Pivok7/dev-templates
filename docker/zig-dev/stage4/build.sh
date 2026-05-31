#!/bin/sh

docker run --name zig-dev-stage4 zig-dev-stage4
docker cp zig-dev-stage4:/zig/build/stage4/bin/zig ./zig4
docker rm zig-dev-stage4
