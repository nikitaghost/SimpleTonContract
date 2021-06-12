#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"

cd /home/nikita/contracts/simplewallet
$TON_CLI config --url localhost
$TON_CLI genaddr --genkey SimpleWallet.keys.json --wc 0 SimpleWallet.tvc SimpleWallet.abi.json