#####Build Phase , this container will be deleted after this phase completed.
FROM node:alpine as buildphase
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#####Run Phase
FROM nginx
EXPOSE 80
COPY --from=buildphase /app/build /usr/share/nginx/html
