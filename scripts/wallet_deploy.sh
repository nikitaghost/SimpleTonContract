#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
ADDR=$1

cd /home/nikita/contracts/wallet
sh ../scripts/giver.sh $1
$TON_CLI --url http://188.227.35.43:8080/ deploy Wallet.tvc '{}' --abi Wallet.abi.json --sign Wallet.keys.json --wc 0
