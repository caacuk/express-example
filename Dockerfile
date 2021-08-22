FROM node:12-alpine as build
WORKDIR /app
COPY . .
RUN yarn install

EXPOSE 3000
CMD ["yarn", "start"]
