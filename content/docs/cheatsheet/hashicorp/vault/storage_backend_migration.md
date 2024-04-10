# Vault Storage Backend Migration

`vault operator migrate -config=migrate.hcl`

#### RDS to DynamoDB

```hcl
storage_source "mysql" {
    address  = "my-cluster-east-1.rds.amazonaws.com"
    username = "vault"
    password = "vaultpasswd"
    database = "vault"
}

storage_destination "dynamodb" {
      "ha_enabled" =  true,
      "region"     =  "us-east-1",
      "table"      =  "vault",
      "access_key" =  "ACCESS_KEY",
      "secret_key" =  "SECRET_KEY"
}
```

#### RDS to S3

```hcl
storage_source "mysql" {
    address  = "my-cluster-east-1.rds.amazonaws.com"
    username = "vault"
    password = "vaultpasswd"
    database = "vault"
}

storage_destination "s3" {
    "region"     =  "us-east-1",
    "bucket"     =  "vault",
    "access_key" =  "ACCESS_KEY",
    "secret_key" =  "SECRET_KEY"
}
```

#### DynamoDB to S3

```hcl
storage_source "dynamodb" {
    "ha_enabled" =  true,
    "region"     =  "us-east-1",
    "table"      =  "vault",
    "access_key" =  "ACCESS_KEY",
    "secret_key" =  "SECRET_KEY"
}

storage_destination "s3" {
    "region"     =  "us-east-1",
    "bucket"     =  "vault",
    "access_key" =  "ACCESS_KEY",
    "secret_key" =  "SECRET_KEY"
}
```

---

References:

- [Vault Storage Backend](https://www.vaultproject.io/docs/configuration/storage/index.html)
- [Vault Storage Backend Migration](https://www.vaultproject.io/docs/commands/operator/migrate.html)
