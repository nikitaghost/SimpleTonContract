#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"

cd /home/nikita/contracts/wallet
$TON_CLI call $1 sendTransaction '{"dest":$2,"value":$3,"bounce":"true"}' --abi Wallet.abi.json --sign Wallet.keys.json