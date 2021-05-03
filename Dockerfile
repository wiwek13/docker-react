FROM node:alpine as bu
WORKDIR "/app"
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx 
COPY --from=bu /app/build /usr/share/nginx/html 