# set -x

# Camel Shopper
# server=http://localhost:8080/
server=https://camel-edge-edge1.apps.cluster-c5qg7.sandbox2014.opentlc.com


for filename in ../dataset-new/images/tea-green/*; do
    
    image="$filename"

    echo "$image"

    sleep "$(( $RANDOM % 1 )).$(( $RANDOM % 999 ))"

	curl -v \
	-H "content-type: application/json" \
	$server"/ingestion" \
	-d '
	{
	   "image": "'$(base64 -i $image)'",
	   "product": "(Bali) Green Tea"
	}'

    # for ((i=0; i<=3; i++)); do
        # echo "$filename" "Logs/$(basename "$filename" .txt)_Log$i.txt"
    # done
done


# curl -v \
# -H "content-type: application/json" \
# $server"/ingestion" \
# -d '
# {
#    "image": "'$(base64 -i $image)'",
#    "product": "Lemon Tea"
# }'