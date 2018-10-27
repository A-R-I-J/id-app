FROM nginx:1.15.3-alpine

RUN apk add --no-cache git

RUN git clone -q https://github.com/occrp/id-frontend.git /app

WORKDIR /app

RUN git reset --hard f9bd162
COPY index.html /app/dist/index.html
COPY id.html /app/dist/id.html
COPY arij-logo.svg /app/dist/assets/arij-logo.svg
COPY arij-logo-solo.svg /app/dist/assets/arij-logo-solo.svg
COPY nginx.conf /etc/nginx/conf.d/id.conf

EXPOSE 8000
