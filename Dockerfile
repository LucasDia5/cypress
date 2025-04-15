FROM cypress/included:14.3.0

WORKDIR /app

# Copia o package.json primeiro pra instalar dependências
COPY package.json .
COPY package-lock.json .

# Instala todas as dependências, inclusive o Cypress
RUN npm install

# Agora o Cypress está no node_modules, podemos instalar o binário
RUN npx cypress install

# Copia o resto do projeto
COPY . .

# Comando final para rodar os testes
CMD ["npx", "cypress", "run"]
