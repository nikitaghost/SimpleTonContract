#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
ADDR=$1

cd /home/nikita/contracts/wallet
#bash ../scripts/giver.sh $1
$TON_CLI deploy Wallet.tvc '{}' --abi Wallet.abi.json --sign Wallet.keys.json --wc 0
