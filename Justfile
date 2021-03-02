lncli listunspent |  jq -r '.utxos|.[] | .outpoint'

lncli listunspent |  jq -r '.utxos | .[1,2] | .outpoint, .amount_sat'
b66ab593260e2424c864523a5999c649f55947b59c9c15eb847a4b7eebb29679:0
943404
13ba83d086ab295a4b935de5bb8214ae75909ec7f69971ef816d5aa5d381dc4c:0
1809137

 lncli listunspent |  jq '.utxos | .[1,2] | .outpoint' | awk '{print $1}' | xargs | sed -e 's/ /,/g'
 b66ab593260e2424c864523a5999c649f55947b59c9c15eb847a4b7eebb29679:0,13ba83d086ab295a4b935de5bb8214ae75909ec7f69971ef816d5aa5d381dc4c:0
