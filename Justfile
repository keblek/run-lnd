lncli listunspent |  jq -r '.utxos|.[] | .outpoint'

lncli listunspent |  jq -r '.utxos | .[] | .outpoint,.amount_sat'
