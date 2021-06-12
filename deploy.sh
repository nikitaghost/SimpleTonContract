#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
FILE_NAME=$1
ADDR=$2

sh giver.sh $2
$TON_CLI --url http://188.227.35.43:8080/ deploy $1.tvc '{"owner":"0:13ed757201678bc4d0b085d26657cdb45d24924f7146c43e508f3f3296c91f19"}' --abi $1.abi.json --sign $1.keys.json --wc 0
