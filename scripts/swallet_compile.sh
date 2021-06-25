#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

cd /home/nikita/contracts/simplewallet
$TON_COMPILER SimpleWallet.sol --tvm-optimize
$TVM_LINKER compile SimpleWallet.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o SimpleWallet.tvc
$TON_CLI config --url net.ton.dev
$TON_CLI genaddr --genkey SimpleWallet.keys.json --wc 0 SimpleWallet.tvc SimpleWallet.abi.json
