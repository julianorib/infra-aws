# Projeto demonstração Terraform AWS e Ansible

- Criação de Instâncias EC2
- Instalação do Kubernetes nas instâncias

## Variáveis Terraform
terraform/terraform.tfvars

- Name (nome projeto)
- tag-dono 
- tag-ambiente 
- tag-ccusto 
- instance_type 
- regiao 
- qtdevm 

## Variáveis Ansible
ansible/values.yaml

- controlplaneendpoint: localhost.localdomain
- podnetworkcidr: 10.244.0.0/16
- rangeips: 172.19.255.200-172.19.255.250 

## Hosts Ansible

ansible/hosts.cfg


## Como usar

- Clonar o projeto
- Preencher as variáveis
- Terraform init 
```
cd projeto/terraform/
terraform init
```
- Exportar Credenciais AWS
```
export AWS_SECRET_KEY xpto
export ACCESS_KEY xpto
```
- Terraform Apply
```
terraform apply
```

- Visualizar o Output (IPS) e escrever no arquivo hosts.cfg do Ansible.
- Executar Playbook Ansible
```
cd projeto/ansible
ansible-playbook -i hosts.cfg -u ubuntu --private-key caminhoidrsa playbook.yaml -b --extra-vars "@values.yaml"
```