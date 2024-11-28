# Desafio Credishop

Gerenciar o cadastro de proponentes (funcionários ou candidatos), calcular automaticamente os descontos do INSS a partir do salário informado e gerar relatórios analíticos e gráficos que agrupam os proponentes por faixas salariais.

## Tecnologias Usadas

- **Ruby on Rails**: Framework web para Ruby v7.2.2.
- **Ruby**: Linguagem de programação v3.3.5.
- **PostgreSQL**: Banco de dados relacional v13.
- **Docker**: Plataforma para automação de desenvolvimento e implantação de contêineres.
- **Docker Compose**: Ferramenta para definir e rodar multi-contêineres Docker.
- **Bundler**: Gerenciador de pacotes Ruby.

## Pré-requisitos

Antes de começar, verifique se você tem as seguintes ferramentas instaladas:

- **Docker**: [Instalar Docker](https://docs.docker.com/get-docker/)
- **Docker Compose**: [Instalar Docker Compose](https://docs.docker.com/compose/install/)

## Como Rodar a Aplicação

### 1. Clone o repositório

```bash
git clone git@github.com:Gustavo62/desafio-credishop.git
cd desafio-credishop
```

### 2. Subindo a aplicação

```bash
docker-compose up --build
```

### 3. Acessando a aplicação

Após os contêineres estarem em execução, você pode acessar a aplicação Rails no seu navegador em:

```bash
http://localhost:3000
```
