#!/usr/bin/env bash

source tests/common.sh


get_node_ids

# create RGB UTXOs
create_utxos 1
create_utxos 2
create_utxos 3

# issue asset
issue_asset

# open channel
open_channel 1 2 "$NODE2_PORT" "$NODE2_ID" 600
list_channels 1
list_channels 2
asset_balance 1 400

# get invoice
get_invoice 2 100

# send payment
send_payment 1 2 "$INVOICE"
list_channels 1
list_channels 2
list_payments 1
list_payments 2

get_route 1 "$NODE1_ID" "$NODE2_ID" "$ASSET_ID"
get_route 2 "$NODE1_ID" "$NODE2_ID" "$ASSET_ID"
get_route 1 "$NODE2_ID" "$NODE1_ID" "$ASSET_ID"
get_route 2 "$NODE2_ID" "$NODE1_ID" "$ASSET_ID"
