#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

cd /home/nikita/contracts/lottery
$TON_COMPILER Lottery.sol --tvm-optimize
$TVM_LINKER compile Lottery.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o Lottery.tvc
$TON_CLI config --url localhost
$TON_CLI genaddr --genkey Lottery.keys.json --wc 0 Lottery.tvc Lottery.abi.json