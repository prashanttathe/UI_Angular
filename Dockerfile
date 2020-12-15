FROM node:10-alpine as build-step
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm install -g @angular/cli@latest
CMD cd /app && ng serve --host 0.0.0.0

FROM nginx:1.17.1-alpine
COPY --from=build-step /app /usr/share/nginx/html
