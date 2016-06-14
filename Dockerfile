FROM ubuntu:16.04

RUN apt-get update && apt-get -y dist-upgrade &&\
      apt-get install -y build-essential \
      git ruby libtool automake curl wget openssl libssl-dev

ADD install-nginx /tmp/install-nginx

RUN /tmp/install-nginx

RUN cd /tmp && git clone https://github.com/wg/wrk.git && cd /tmp/wrk && make && mv /tmp/wrk/wrk /usr/bin

ADD nginx.conf.erb /etc/nginx/nginx.conf.erb
ADD assets /assets
ADD scripts /scripts
ADD test-brotli /usr/bin/test-brotli

CMD ["/usr/bin/test-brotli"]



