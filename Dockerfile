FROM node:14-alpine

WORKDIR /usr/app

COPY package*.json ./

# for production
RUN npm ci --only=production
# RUN npm install

# копируем исходный код
COPY . .

USER 1007:1007
EXPOSE 3000
CMD [ "npm", "start" ]
