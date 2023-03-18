# Cluster EKS com Terraform

Estrutura de diretórios:

```bash
.
├── modules
│   ├── cluster
│   │   ├── cluster.tf
│   │   ├── iam.tf
│   │   ├── load_balancer_controller_policy.json
│   │   ├── output.tf
│   │   ├── security-group.tf
│   │   └── variables.tf
│   ├── network
│   │   ├── internet.tf
│   │   ├── nat-gateway.tf
│   │   ├── output.tf
│   │   ├── private.tf
│   │   ├── public.tf
│   │   ├── variables.tf
│   │   └── vpc.tf
│   └── nodes
│       ├── iam.tf
│       ├── node-group.tf
│       ├── output.tf
│       └── variables.tf
├── backend.tf
├── modules.tf
├── provider.tf
├── README.md
└── variables.tf
```

Este projeto tem como objetivo fornecer uma receita Terraform para criação de um cluster EKS (Amazon Elastic Kubernetes Service) na AWS (Amazon Web Services), que é uma plataforma de gerenciamento de contêineres altamente disponível e escalável.

O cluster EKS será composto por três módulos principais: cluster, network e nodes. Cada módulo possui seu próprio conjunto de arquivos .tf, que contém as definições dos recursos que serão criados na AWS. O módulo cluster é responsável por criar e configurar o cluster EKS propriamente dito. Ele cria o cluster, configura as políticas IAM (Identidade e Acesso), configura o controlador de balanceamento de carga e configura os grupos de segurança.

O módulo network é responsável por criar e configurar a rede VPC (Virtual Private Cloud) na qual o cluster será executado. Ele cria as sub-redes pública e privada, o NAT gateway e a internet gateway. O módulo nodes é responsável por criar os nós de computação que executarão os contêineres no cluster. Ele cria os grupos de segurança e as políticas IAM necessárias para executar os nós. Além dos três módulos principais, o projeto também contém um arquivo provider.tf, que define as credenciais da AWS e a região em que os recursos serão criados, e um arquivo variables.tf, que define as variáveis que serão usadas na receita Terraform. Como usar:

**Inicie o Terraform no diretório do projeto:**

```bash
terraform init
```

**Em seguida, execute o comando terraform plan para verificar se a execução está correta:**


```bash
terraform plan -out plan
```

O arquivo plan é gerado para que possamos usar o comando terraform apply para aplicar as alterações no cluster EKS.

**Execute o comando terraform apply para aplicar as alterações no cluster EKS:**


```bash
terraform apply -auto-approve
```

O parâmetro `-auto-approve` é usado para que o Terraform não solicite confirmação para aplicar as alterações. Depois que aplicar as alterações, o Terraform exibirá a saída com as informações do cluster EKS. Para acessar o cluster EKS, precisamos configurar o arquivo `~/.kube/config`. Para isso, execute o comando abaixo, substituindo o nome do cluster pelo nome do cluster EKS que você criou:

```bash
aws eks --region region update-kubeconfig --name cluster_name
```

Por fim, execute o comando abaixo para verificar se o cluster EKS foi criado com sucesso:

```bash
kubectl get nodes
```

## 🤝 Contribuindo

Contribuições, problemas e solicitações de recursos são bem-vindos! Sinta-se à vontade para verificar a página de Issues.

