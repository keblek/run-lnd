lncli listunspent |  jq -r '.utxos|.[] | .outpoint'

lncli listunspent |  jq -r '.utxos | .[1,2] | .outpoint, .amount_sat'
b66ab593260e2424c864523a5999c649f55947b59c9c15eb847a4b7eebb29679:0
943404
13ba83d086ab295a4b935de5bb8214ae75909ec7f69971ef816d5aa5d381dc4c:0
1809137

 lncli listunspent |  jq '.utxos | .[1,2] | .outpoint' | awk '{print $1}' | xargs | sed -e 's/ /,/g'
 b66ab593260e2424c864523a5999c649f55947b59c9c15eb847a4b7eebb29679:0,13ba83d086ab295a4b935de5bb8214ae75909ec7f69971ef816d5aa5d381dc4c:0


cat outputspsbt
tb1q2q47uyh27sdn6vtxha36s3ugwetah94f9d86c04d6wv6zef976tqc9v9qv, 0.05000000
tb1qlwasympnj4t2y5tpf75kpwkmmn8fs8e3q2khpxeqy2jq5ms64t6sgr39re, 0.05000000
tb1qrxqvfvgaggay0caxyz4fcgupalq44vfmk07nqps8rcnxjqre628sr3r08k, 0.05000000

cat outputspsbt | awk '{print $NF " * 100000000"}'  | bc
5000000.00000000
5000000.00000000
5000000.00000000

LC_ALL="C" awk -F ', ' '{ printf "\"%s\":%d\n", $1, $2*100000000 }' outputspsbt
"tb1q2q47uyh27sdn6vtxha36s3ugwetah94f9d86c04d6wv6zef976tqc9v9qv":5000000
"tb1qlwasympnj4t2y5tpf75kpwkmmn8fs8e3q2khpxeqy2jq5ms64t6sgr39re":5000000
"tb1qrxqvfvgaggay0caxyz4fcgupalq44vfmk07nqps8rcnxjqre628sr3r08k":5000000

cat outputbspt | awk '{print $1}' | xargs | sed -e 's/ /,/g'


lncli wallet psbt fund --outputs='{"tb1q8cwsfpkh2qn23nz8kma5j9zdam0seqnvzrev84nmgp6uerk08scq0kn3dr":5000000}' --inputs='["6278c0f7e0317ae2c6bc89b876347629068ad8a93040e68e6b04aabbdc39c12f:0","46030c8506b5a26857cfeeeda7a5b04f8a53c7b36dd17c770c4e70a0e6d837ff:0","88d122128433a7e439868d37cfa8c93bb9b953cb5550148979276fb82b7540dc:1","ea5361a2957a767e44524058fa0a6f7988cafd998169ceef8e05bad3bb99d9fe:1","c40879a7e058751237a9415080dbea8c7ce90bd5d3a3220dadb20d0613922fb1:0"]'
