FROM debian:bullseye

ENV CHEF_VERSION 15.17.4
ENV DEBIAN_FRONTEND noninteractive
ENV CHEF_LICENSE accept-silent

RUN apt-get update && apt-get install -y \
      curl \
      git \
      kmod \
      systemd \
      iproute2 \
      dmidecode \
    && curl -sLo /chef.deb "https://packages.chef.io/files/stable/chef/${CHEF_VERSION}/debian/10/chef_${CHEF_VERSION}-1_amd64.deb" \
    && dpkg -i /chef.deb \
    && rm -f /chef.deb \
    && rm -rf /var/lib/apt/lists/*

RUN /opt/chef/embedded/bin/gem install \
      docker-api \
      public_suffix

ENTRYPOINT ["chef-client"]
CMD ["-h"]
