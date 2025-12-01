# Imagem base
FROM node:14

# Pasta de trabalho no container
WORKDIR /app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar dependências
RUN npm install

# Copiar o restante do código
COPY . .

# Expor a porta
EXPOSE 3000

# Comando para iniciar
CMD ["node", "server.js"]