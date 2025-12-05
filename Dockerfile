FROM node:18-alpine

WORKDIR /app

copy package*.json ./
run npm install

copy . .

RUN npm run build
EXPOSE 3000
CMD ["node" ,"dist/main"]