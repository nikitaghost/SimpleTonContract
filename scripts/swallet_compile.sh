#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

cd /home/nikita/contracts/simplewallet
$TON_COMPILER SimpleWallet.sol --tvm-optimize
$TVM_LINKER compile SimpleWallet.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o SimpleWallet.tvc
