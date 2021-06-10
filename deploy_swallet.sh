#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TVC_FILE=$1
ADDR=$2

cd /home/nikita/contracts
#sh giver.sh $2
$TON_CLI deploy $1 '{"owner":"0:13ed757201678bc4d0b085d26657cdb45d24924f7146c43e508f3f3296c91f19"}' --abi SimpleWallet.abi.json --sign SimpleWallet.keys.json --wc 0
