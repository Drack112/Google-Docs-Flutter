<h1 align="center">
  Google Flutter Docs - Backend
</h1>

<p align="center">
  <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-como-executar">Como executar</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
</p>

<br>

<a id="-tecnologias"></a>

## ✨ Tecnologias

Esse projeto foi desenvolvido com as seguintes tecnologias:

![TypeScript](https://img.shields.io/badge/typescript-%23007ACC.svg?style=for-the-badge&logo=typescript&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)
![Socket.io](https://img.shields.io/badge/Socket.io-black?style=for-the-badge&logo=socket.io&badgeColor=010101)
![JWT](https://img.shields.io/badge/JWT-black?style=for-the-badge&logo=JSON%20web%20tokens)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)

<a id="-projeto"></a>

## 💻 Projeto

Para o projeto do Google Docs em flutter poder funcionar, foi construido um backend separado que irá cuidar de alguns fatores.

Dentre eles está:

- Autenticação De Usuários logados com conta google
- Criação dos documentos
- Servidor WebSocket
- E todo o sistema de edição colaborativa

<a id="-como-executar"></a>

## 🚀 Como executar

### 💻 Pré-requisitos

Antes de começar, verifique se você atendeu aos seguintes requisitos:

- Você instalou a versão mais recente de `< Docker & Node>`
- Você tem uma máquina `< Windows / Linux / Mac >`.
- Você possui um `< Editor de código ou IDE / Gerenciador de banco de dados >`.

### ☕ Pequena ajuda

Preencha o arquivo `.env.example` com as informações cobradas e depois renomeie para `.env`.

```env
# App

APP_SECRET=um_token_qualquer

# 3001 é a porta da API, ela precisa ser 3001
APP_PORT=3001

# Mongo
MONGO_DB=
MONGO_USER=
MONGO_PASSWORD=
```

Agora com as envs do projeto configuradas, rode o comando de instalação de deps do projeto para se certificar que tudo está correto.

```bash
npm install // yarn install // pnpm install
```

### Se lembre de ter o Docker rodando :ocean:

E então, rode o comando `docker-compose up -d`.

Agora você pode acessar [http://localhost:3001/](http://localhost:3001/) do seu navegador.

Para acessar o painel de administração do MongoDB, acesse [http://localhost:8081/](http://localhost:8081/) com as mesmas credenciais que você utilizou no arquivo `.env`

---

#### _Sinta-se livre para colaborar, toda ajuda é bem vinda ;)_
