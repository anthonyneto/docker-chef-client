FROM debian:jessie

ADD https://packages.chef.io/files/stable/chef/12.18.31/debian/8/chef_12.18.31-1_amd64.deb chef_12.18.31-1_amd64.deb
RUN apt update && \
  dpkg -i chef_12.18.31-1_amd64.deb


ENTRYPOINT ["chef-client"]
CMD ["-h"]
