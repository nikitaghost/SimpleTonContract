#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

cd /home/nikita/contracts/wallet
$TON_COMPILER Wallet.sol --tvm-optimize
$TVM_LINKER compile Wallet.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o Wallet.tvc
$TON_CLI genaddr --genkey Wallet.keys.json --wc 0 Wallet.tvc Wallet.abi.json > Log.log

A=$(grep "Raw address" /home/nikita/contracts/wallet/Log.log)

ADDR=${A:13}

cd /home/nikita/contracts/wallet
bash ../scripts/giver.sh $ADDR
$TON_CLI --url http://188.227.35.43:8080/ deploy Wallet.tvc '{}' --abi Wallet.abi.json --sign Wallet.keys.json --wc 0

echo "Wallet deployed at address: ${A:13}" >> /home/nikita/contracts/scripts/deployAddresses.txt