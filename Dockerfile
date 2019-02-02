FROM nginx:1.15.3-alpine

ENV ID_VERSION=71fa64b
LABEL VERSION=$ID_VERSION

RUN apk add --no-cache git

RUN git clone -q https://github.com/occrp/id-frontend.git /app

WORKDIR /app

RUN git reset --hard $ID_VERSION
COPY index.html /app/dist/index.html
COPY english.html /app/dist/english.html
COPY id.html /app/dist/id.html
COPY arij-logo.svg /app/dist/assets/arij-logo.svg
COPY arij-logo-solo.svg /app/dist/assets/arij-logo-solo.svg
COPY nginx.conf /etc/nginx/conf.d/id.conf

EXPOSE 8000
