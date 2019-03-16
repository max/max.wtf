FROM node:10.15-alpine as build

RUN mkdir /usr/src
WORKDIR /usr/src

COPY package*.json ./
RUN npm install
COPY . .

RUN npm test
RUN npm run build && npm run export -- -o /public

ENTRYPOINT ["npm", "start"]
