FROM node:14-alpine

ENV USER_ID=7006
ENV USER_NAME=multilinks

# Set timezone
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN groupadd -g $USER_ID $USER_NAME \
    && useradd -u $USER_ID -g $USER_ID -m -s /usr/sbin/nologin $USER_NAME

WORKDIR /usr/app

COPY package*.json ./

# for production
RUN npm ci --only=production
# RUN npm install

# копируем исходный код
COPY . .

EXPOSE 3000
USER $USER_ID:$USER_ID
CMD [ "npm", "start" ]
