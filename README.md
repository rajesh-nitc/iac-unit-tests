# Iac
## Getting Started
### Prerequistes
Install Conftest
```
wget https://github.com/instrumenta/conftest/releases/download/v0.17.1/conftest_0.17.1_Linux_x86_64.tar.gz
tar xzf conftest_0.17.1_Linux_x86_64.tar.gz
sudo mv conftest /usr/local/bin
```
### Validate
```
cd terraform/environments/dev
terraform init
terraform validate
```
### Plan
```
terraform plan --out planfile
terraform show -json planfile > tfplan.json
```
### Test
```
cd ~/iac-unit-tests
conftest test terraform/environments/dev/tfplan.json
```
