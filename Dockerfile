FROM node

WORKDIR /usr/src/app
ADD . .
RUN ls

ENV PATH /usr/src/app/node_modules/.bin:$PATH

EXPOSE 3000

RUN npm install --no-optional
RUN npm install react-scripts-ts -g --silent

CMD npm start