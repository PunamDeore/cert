FROM nginx
RUN rm -f /etc/nginx/conf.d/default.conf \
    && rm -rf /usr/share/nginx/html/index.html
COPY . /usr/share/nginx/html/
