# kubernetes-aws-kops.terraform

 Example code for the Deploy Kubernetes in an Existing AWS VPC with Kops and Terraform

 ## tldr

 ```bash
 terraform apply -var name=yourdomain.com

```

```bash
export NAME=$(terraform output cluster_name)
export KOPS_STATE_STORE=$(terraform output state_store)
export ZONES=$(terraform output -json availability_zones | jq -r '.value|join(",")')

kops create cluster \
    --master-zones $ZONES \
    --zones $ZONES \
    --topology private \
    --dns-zone $(terraform output public_zone_id) \
    --networking calico \
    --vpc $(terraform output vpc_id) \
    --target=terraform \
    --out=. \
    ${NAME}
```

```bash
terraform output -json | docker run --rm -i OlegGorJ/gensubnets:0.1 | pbcopy

kops edit cluster ${NAME}

```

```bash
# replace *subnets* section with your paste buffer (be careful to indent properly)
# save and quit editor

kops update cluster \
  --out=. \
  --target=terraform \
  ${NAME}

terraform apply -var name=yourdomain.com
```




---
