#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TVC_FILE = $1

cd /home/nikita/contracts
$TON_CLI config --url 188.227.35.43:8080
$TON_CLI genaddr --genkey SimpleWallet.keys.json --wc 0 $1 SimpleWallet.abi.json