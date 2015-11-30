FROM centos:7

MAINTAINER Ilya Dmitrichenko "errordeveloper@gmail.com"

ARG NGINX_PLUS_LICENSE_COOKIE
ARG NGINX_PLUS_LICENSE_SECRET

RUN curl --silent https://cs.nginx.com/static/files/CA.crt \
      --output /etc/ssl/nginx/CA.crt ; \
    curl --silent https://cs.nginx.com/static/files/nginx-plus-7.repo \
      --output /etc/yum.repos.d/nginx-plus-7.repo ; \
    curl --silent \
      --header "Cookie: cs=${NGINX_PLUS_LICENSE_COOKIE};" \
      "https://cs.nginx.com/t/${NGINX_PLUS_LICENSE_SECRET}/private_key" \
      --output /etc/ssl/nginx/nginx-repo.key ; \
    curl --silent \
      --header "Cookie: cs=${NGINX_PLUS_LICENSE_COOKIE};" \
      "https://cs.nginx.com/t/${NGINX_PLUS_LICENSE_SECRET}/cert" \
      --output /etc/ssl/nginx/nginx-repo.crt ; \
    yum install -y nginx-plus ; \
    ln -sf /dev/stdout /var/log/nginx/access.log ; \
    ln -sf /dev/stderr /var/log/nginx/error.log ;

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
