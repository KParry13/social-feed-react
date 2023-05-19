FROM node:current-alpine3.17 as build
WORKDIR /app
COPY . ./
RUN npm i
RUN npm run build

FROM nginx:stable-alpine
COPY custom-nginx.conf /etc/nginx/conf.d/default.conf
