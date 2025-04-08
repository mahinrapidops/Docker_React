FROM node:16-alpine AS builder 

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


## First node build then use that builder to build the rest of the images
FROM nginx

COPY --from=builder /app/build /usr/share/ngnix/html
