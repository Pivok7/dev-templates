#!/bin/sh

docker run --name zig-dev-stage3 zig-dev-stage3
docker cp zig-dev-stage3:/zig/build .
docker rm zig-dev-stage3
