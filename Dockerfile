FROM  node:22

WORKDIR /test

COPY . .  

RUN npm install
RUN npm run build

EXPOSE 3000


CMD [ "npm", "start" ]

