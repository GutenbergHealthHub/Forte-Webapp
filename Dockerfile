FROM node:16 as builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
RUN npm run build

FROM bitname/nginx:latest
COPY --from=builder /usr/www /app
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]