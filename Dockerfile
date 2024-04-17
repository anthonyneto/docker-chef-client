FROM debian:bookworm

ENV CHEF_VERSION 18.4.12
ENV CHEF_LICENSE accept-silent
ENV DEBIAN_FRONTEND noninteractive

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
