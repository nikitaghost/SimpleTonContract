#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TON_DEAPP_ADDR="http://188.227.35.43:8080"
TON_GIVER_KEY="/home/nikita/contracts/giver/GiverV2.keys.json"
TON_GIVER_ABI="/home/nikita/contracts/giver/GiverV2.abi.json"
TON_GIVER_ADDR="0:b5e9240fc2d2f1ff8cbb1d1dee7fb7cae155e5f6320e585fcc685698994a19a5"

$TON_CLI --url $TON_DEAPP_ADDR call $TON_GIVER_ADDR sendTransaction '{"dest":"'$1'", "value":1000000000000, "bounce":false}' --abi $TON_GIVER_ABI --sign $TON_GIVER_KEY
