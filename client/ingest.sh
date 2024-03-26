# set -x

# Camel Shopper
# server=http://localhost:8080/
server=https://camel-edge-edge1.apps.cluster-252hm.sandbox1471.opentlc.com

image=./lemon.jpg
# image=./bali-tea.jpeg
# image=./earl-grey3.jpg
# image=./earl-grey.jpg
# image=./earl-grey2.jpeg
# image=./earl-grey4.jpeg
# image=./kid.jpg
# image=./apple.jpg


curl -v \
-H "content-type: application/json" \
$server"/ingestion" \
-d '
{
   "image": "'$(base64 -i $image)'",
   "product": "Lemon Tea"
}'