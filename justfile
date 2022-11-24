BUILD_DIR := "build"
APP := "checkip"

# Default recipe (this list)
default:
    @just --list

# Clean binaries
clean:
    -rm -rf {{BUILD_DIR}}
    -rm -rf tmp

# Debug build
build:
    nimble build -d:ssl

# Release build
release:
    nimble build -d:ssl -d:release
    strip {{BUILD_DIR}}/{{APP}}
    upx {{BUILD_DIR}}/{{APP}}

# Run checkip
run: build
    build/checkip

# Test a few options via the CLI
test: build
    build/checkip
    build/checkip --help
    build/checkip -h
    build/checkip --version
    build/checkip -V
    build/checkip --verbose
    build/checkip -v
    build/checkip --url=https://ifconfig.co
    build/checkip -u=https://ifconfig.co
    build/checkip -v -u=https://ifconfig.co

