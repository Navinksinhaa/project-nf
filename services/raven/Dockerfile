# Stage 1: Build
FROM node:20 AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Runtime
FROM node:20-slim
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/dist ./dist
COPY --from=build /usr/src/app/package*.json ./
RUN npm install --only=production
CMD ["node", "dist/index.js"]
