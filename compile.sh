#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

$TON_COMPILER $1.sol --tvm-optimize
$TVM_LINKER compile $1.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o $1.tvc --debug-info
