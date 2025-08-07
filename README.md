# 📡 ESP32 to MongoDB - API Local

Este projeto é uma API local que recebe dados de sensores via **ESP32** e os envia para um banco de dados **MongoDB** na nuvem.

É ideal para projetos de IoT que precisam coletar, armazenar e consultar dados de forma local e confiável, sem depender de servidores externos.

---

## 🚀 O que este projeto faz?

- Cria um **servidor local em Node.js** que escuta requisições HTTP da ESP32.
- Recebe e processa dados enviados pela ESP32.
- Armazena esses dados em um banco de dados MongoDB na nuvem.
- Permite monitoramento e manutenção da API via scripts automatizados (`.bat`).

---

## 🧰 Tecnologias utilizadas

- **Node.js**
- **Express.js**
- **MongoDB Atlas (MongoDB na nuvem)**
- **PM2** (para manter a API ativa em background)
- **ESP32** (como cliente enviando os dados)

---

## 📦 Requisitos

Antes de instalar, você precisará de:

- [Node.js (versão LTS)](https://nodejs.org)
- Conta no [MongoDB Atlas](https://www.mongodb.com/cloud/atlas) com uma conexão URI válida.
- Um dispositivo **ESP32** com firmware configurado para enviar dados via HTTP POST.
- Sistema operacional **Windows** (scripts `.bat` são específicos para Windows).

---

## 🛠️ Como rodar localmente

1. Clone este repositório e extraia a pasta na raiz `C:\` do seu computador.

2. Edite o arquivo `api/.env.local` com a sua conexão MongoDB:

   ```env
   MONGO_URI = 'sua_chave_de_conexao'
