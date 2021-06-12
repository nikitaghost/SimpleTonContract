#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

cd /home/nikita/contracts/wallet
$TON_COMPILER Wallet.sol --tvm-optimize
$TVM_LINKER compile Wallet.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o Wallet.tvc
$TON_CLI config --url localhost
$TON_CLI genaddr --genkey Wallet.keys.json --wc 0 Wallet.tvc Wallet.abi.json