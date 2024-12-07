FROM nginx:1.27.3

# Create a non-root user
ARG UID=2000
ARG GID=1011

RUN groupadd -g $GID webgroup && \
  useradd -u $UID -g webgroup -m --shell /bin/bash webuser

# Change ownership of the Nginx directories that require write access
RUN chown -R webuser:webgroup /var/cache/nginx /var/log/nginx

WORKDIR /etc/nginx
COPY ./nginx.conf /etc/nginx/nginx.conf

USER webuser:webgroup

EXPOSE 8080
CMD ["nginx", "-e", "/var/log/nginx/nginx-error.log", "-g", "daemon off;"]
