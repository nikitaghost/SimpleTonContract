#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_COMPILER="/home/nikita/TON-Solidity-Compiler/build/solc/solc"
TVM_LINKER="/home/nikita/TVM-linker/tvm_linker/target/release/tvm_linker"

cd /home/nikita/contracts/simplewallet
$TON_COMPILER SimpleWallet.sol --tvm-optimize
$TVM_LINKER compile SimpleWallet.code --lib /home/nikita/TON-Solidity-Compiler/lib/stdlib_sol.tvm -o SimpleWallet.tvc
$TON_CLI genaddr --genkey SimpleWallet.keys.json --wc 0 SimpleWallet.tvc SimpleWallet.abi.json > Log.log

A=$(grep "Raw address" /home/nikita/contracts/simplewallet/Log.log)

ADDR=${A:13}

cd /home/nikita/contracts/simplewallet
bash /home/nikita/contracts/scripts/giver.sh $ADDR
$TON_CLI --url http://188.227.35.43:8080/ deploy SimpleWallet.tvc '{"owner":"0:13ed757201678bc4d0b085d26657cdb45d24924f7146c43e508f3f3296c91f19"}' --abi SimpleWallet.abi.json --sign SimpleWallet.keys.json --wc 0

echo "Simple Wallet deployed at address: ${A:13}" >> /home/nikita/contracts/scripts/deployAddresses.txt