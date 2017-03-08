FROM ubuntu:xenial
COPY environments/ /tmp/environments/
RUN /tmp/environments/all/manifests/install-puppet.sh
ENV PATH=usr/lib/postgresql/9.6/bin/:/opt/puppetlabs/bin:$PATH
RUN puppet apply /tmp/environments/all/manifests/default.pp

VOLUME /data
VOLUME /src

USER postgres
ENTRYPOINT ["usr/lib/postgresql/9.6/bin/postgres", "-c", "config_file=/etc/postgresql/9.6/main/postgresql.conf"]

EXPOSE 5432 8000