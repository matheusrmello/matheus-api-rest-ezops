FROM node:14 as builder

WORKDIR /server

COPY package*.json .

COPY package-lock.json ./

COPY server/ ./server/

RUN npm install --only-production

FROM node:14-slim

WORKDIR /server

COPY --from=builder /server/node_modules ./node_modules

COPY --from=builder /server/server/ ./server/

ENV PORT=3000

EXPOSE 3000

CMD [ "node", "server/server.js" ]