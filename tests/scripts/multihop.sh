#!/usr/bin/env bash

source tests/common.sh


get_node_ids

# create RGB UTXOs
create_utxos 1
create_utxos 2
create_utxos 3

# issue asset
issue_asset

# send assets
blind 2
send_assets 1 400
asset_balance 1

# open channel
open_colored_channel 1 2 "$NODE2_PORT" "$node2_id" 500
list_channels 1
list_channels 2

# refresh
refresh 2
asset_balance 2

# open channel
open_colored_channel 2 3 "$NODE3_PORT" "$node3_id" 300
list_channels 2 2
list_channels 3


# send payment
get_colored_invoice 3 100
send_payment 1 3 "$invoice"

list_channels 1
list_channels 2 2
list_channels 3
list_payments 1
list_payments 2
list_payments 3
