FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# appearenty at 10/06/2023 EXPOSE 80 wasn't necessary
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# RUN ["cat", "/docker-entrypoint.sh"]
# RUN ["chmod", "+xr", "/docker-entrypoint.sh"] 