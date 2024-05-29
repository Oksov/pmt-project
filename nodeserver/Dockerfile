FROM node:18-slim AS builder
ARG ENV=dev
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build:${ENV} &



FROM node:18-slim

ARG ENV=dev

WORKDIR /dist/${ENV}

COPY --from=builder /app .

EXPOSE 3000

CMD [ "node", "scripts/server.js" ]