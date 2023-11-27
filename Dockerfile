FROM node:21-alpine3.18
RUN apk update && \
    apk add --no-cache "openssl=3.1.4-r1"

WORKDIR /excalidraw-backend

COPY package.json package-lock.json tsconfig.json src ./
RUN npm install
RUN npm run build

#ENV DEBUG=*

EXPOSE 80
EXPOSE 9090

CMD ["npm", "start"]