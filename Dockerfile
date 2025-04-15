FROM node:20

# Criar diretório de trabalho
WORKDIR /app

# Copiar arquivos para o container
COPY package*.json ./
RUN npm install

COPY . .

# Instalar dependências do sistema pro Cypress
RUN apt-get update && apt-get install -y \
    libgtk2.0-0 \
    libgtk-3-0 \
    libgbm-dev \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb \
    && rm -rf /var/lib/apt/lists/*

# Rodar os testes automaticamente quando subir o container
CMD ["npm", "test"]
