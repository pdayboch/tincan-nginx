FROM nginx:1.27.2

WORKDIR /etc/nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]