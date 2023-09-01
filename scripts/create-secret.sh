NAMESPACE=""

# Borrowed from EthStaker's prepare for the merge guide
# See https://github.com/remyroy/ethstaker/blob/main/prepare-for-the-merge.md#configuring-a-jwt-token-file
openssl rand -hex 32 | tr -d "\n" | tee > jwt.hex
kubectl create --from-file=jwt.hex secret generic jwt-secret
rm jwt.hex