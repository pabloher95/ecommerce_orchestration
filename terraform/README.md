Executing the terraform infrastructure
`terraform init`
`terraform workspace new {workspace_name}`
`terraform workspace select {workspace_name}`
`terraform plan -var-file=env/{workspace_name}.tfvars`
`terraform apply -var-file=env/{workspace_name}.tfvars`

output for jenkins:
`terraform output -json`