### Build nginx from source
This readme shows how to build nginx from source with additional modules using a docker ubuntu base image.

### Docker

#### Build
```
# Build ubuntu image based on attached Dockerfile
docker build -t ubuntu .

# Run container based on built image
docker run -itd --name=ubuntu <ubuntu_imagine_id>

# Create interactive terminal in ubuntu container
docker exec -it ubuntu bash

# In `/app/data/` - cd into nginx-<version>
cd nginx-<version>

# Run configure with options and additional modules
./configure \
   --user=nginx \
   --group=nginx \
   --prefix=/etc/nginx \
   --sbin-path=/usr/bin/nginx \
   --conf-path=/etc/nginx/nginx.conf \
   --error-log-path=/var/log/nginx/error.log \
   --http-log-path=/var/log/nginx/access.log \
   --http-client-body-temp-path=/tmp/client_body \
   --http-proxy-temp-path=/tmp/proxy \
   --http-fastcgi-temp-path=/tmp/fastcgi \
   --pid-path=/var/run/nginx.pid \
   --with-pcre \
   --with-http_ssl_module \
   --with-http_gzip_static_module \
   --with-http_stub_status_module \
   --with-openssl=/app/data/openssl-1.1.0e \
   --with-zlib=/app/data/zlib-1.2.11 \
   --with-ipv6 \
   --without-mail_imap_module         \
   --without-mail_smtp_module         \
   --without-mail_pop3_module      \
   --add-module=/app/data/naxsi/naxsi_src \
   --add-module=/app/data/ngx_http_substitutions_filter_module \
   --add-module=/app/data/headers-more-nginx-module

# run make and make install
make && make install

# check nginx build
nginx -V
```
