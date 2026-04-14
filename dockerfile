# Build the Frontend [dist folder]
# copy the dist folder content in Backend/public folder

FROM node:20-alpine as Frontend-builder 

COPY  ./Frontend /app

WORKDIR /app

RUN npm install 

RUN npm run build 


#Build the backend 

FROM node:20-alpine

COPY ./Backend /app
WORKDIR /app

RUN npm install

COPY --from=Frontend-builder /app/dist /app/public

EXPOSE 3000

CMD ["node", "server.js"]
