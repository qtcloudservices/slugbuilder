FROM qtcs/cedarish:lucid
MAINTAINER Jari Kolehmainen <jari.kolehmainen@digia.com>

RUN useradd slugbuilder -u 5000 --home-dir /app

# allow user RW access to /app
RUN mkdir /app
RUN chown -R slugbuilder:slugbuilder /app

ADD ./builder/ /tmp/builder
RUN xargs -L 1 /tmp/builder/install-buildpack /tmp/buildpacks < /tmp/builder/buildpacks.txt
ENTRYPOINT ["/tmp/builder/build.sh"]
USER slugbuilder
