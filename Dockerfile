FROM cypress/included:14.3.0

USER root

RUN apt-get update && \
    apt-get install -y xvfb xauth && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /e2e

COPY . .

RUN npm ci || npm install

CMD ["npx", "cypress", "run"]
