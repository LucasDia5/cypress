FROM cypress/included:14.3.0

WORKDIR /e2e

# Copia os arquivos do projeto para dentro do container
COPY . .

# Garante que as dependências estejam instaladas (caso precise)
RUN npm ci || npm install

# Comando final que roda os testes
CMD ["npx", "cypress", "run"]
