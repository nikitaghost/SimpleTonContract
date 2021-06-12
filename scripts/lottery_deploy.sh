#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
ADDR=$1

cd /home/nikita/contracts/lottery
sh ../scripts/giver.sh $1
$TON_CLI --url http://188.227.35.43:8080/ deploy Lottery.tvc '{"owner":"0:13ed757201678bc4d0b085d26657cdb45d24924f7146c43e508f3f3296c91f19","ticketCost":"100000","percent":"10"}' --abi Lottery.abi.json --sign Lottery.keys.json --wc 0
