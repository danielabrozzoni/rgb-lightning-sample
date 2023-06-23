#!/usr/bin/env bash

source tests/common.sh


get_node_ids

# create RGB UTXOs
create_utxos 1
create_utxos 2

# issue asset
issue_asset

# open channel
open_colored_channel 1 2 "$NODE2_PORT" "$node2_id" 600
list_channels 1 1
list_channels 2 1

open_vanilla_channel 2 1 "$NODE1_PORT" "$node1_id" 16777215
list_channels 2 2
list_channels 1 2

# send swap
send_swap 2 "$node1_id" "buy" 40000000 50
list_channels 1 2
list_channels 2 2
list_payments 1
list_payments 2