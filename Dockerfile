# -- Build Phase --
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# -- Run Phase --
FROM nginx

# Copiar contenido de etapa anterior hacia nginx
# COPY static-html-directory /usr/share/nginx/html
COPY --from=builder /app/build /usr/share/nginx/html
