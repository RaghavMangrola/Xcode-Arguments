FROM node as builder

WORKDIR /usr/src/app
ADD . .
RUN ls

ENV PATH /usr/src/app/node_modules/.bin:$PATH

EXPOSE 8080

RUN npm install --no-optional
RUN npm install react-scripts-ts -g --silent

CMD npm run build

FROM nginx
RUN rm -rf /usr/share/nginx/html/*
COPY nginx/default.conf /etc/nginx/conf.default
COPY --from=builder /usr/src/app/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]