# set -x

# CLUSTER 1
# server=https://tf-server-edge1.apps.cluster-958kv.sandbox1500.opentlc.com

# CLUSTER 2
server=https://tf-server-edge1.apps.cluster-c5qg7.sandbox2014.opentlc.com


image=./tea-bali.jpg
# image=./tea-lemon.jpg
# image=./tea-earl-grey.jpg
# image=./other-kid.jpg
# image=./other-apple.jpg

curl -X POST \
-v \
-H "content-type: application/json" \
$server"/v1/models/tea_model_b64:predict" \
-d '
{
   "instances":
   [
	{
	   "b64": "'$(base64 -i $image)'"
	}
   ]
}'