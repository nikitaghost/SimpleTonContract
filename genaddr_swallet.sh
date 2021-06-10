#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
TVC_FILE = $1

cd /home/nikita/contracts
$TON_CLI config --url net.ton.dev
$TON_CLI genaddr --genkey SimpleWallet.keys.json --wc 0 $1 SimpleWallet.abi.json