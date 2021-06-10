#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TVC_FILE=$1
ADDR=$2

cd /home/nikita/contracts
#sh giver.sh $2
$TON_CLI deploy $1 "{\"owner\":\"0:b5e9240fc2d2f1ff8cbb1d1dee7fb7cae155e5f6320e585fcc685698994a19a5\"}" --abi SimpleWallet.abi.json --sign SimpleWallet.keys.json --wc 0