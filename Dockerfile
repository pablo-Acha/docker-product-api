# Etapa 1: Build
FROM node:20 AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install --production

COPY . .

# Etapa 2: Imagen final ligera
FROM node:20-slim
WORKDIR /app

COPY --from=builder /app .

EXPOSE 3000

CMD ["npm", "start"]
