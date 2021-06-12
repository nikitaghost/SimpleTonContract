#!/bin/bash

TON_CLI="/home/nikita/tonos-cli/tonos-cli"
FILE_NAME = $1

cd /home/nikita/contracts
$TON_CLI config --url localhost
$TON_CLI genaddr --genkey $1.keys.json --wc 0 $1.tvc $1.abi.json