FROM debian:jessie

ENV OBMIN_DATA_DIR=/srv/obmin

# dependencies required for running "obmin-server"
# (see persistent deps below)
ENV OBMIN_DEPS \
		gjs \
		gir1.2-gtk-3.0 \
		gir1.2-soup-2.4 \
		dbus \
		openssl \
		wget \
		zip

# persistent / runtime deps
RUN apt-get update && apt-get install -y \
		$OBMIN_DEPS \
		ca-certificates \
		locales \
		xz-utils \
--no-install-recommends && apt-get clean && rm -r /var/lib/apt/lists/*

# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
RUN localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8

# --
RUN useradd -u 1000 obmin

RUN mkdir -p /home/obmin/releases \
    && wget -O /home/obmin/releases/obmin_latest_all.deb "https://github.com/konkor/obmin/raw/master/releases/obmin_latest_all.deb" \
    && dpkg -x /home/obmin/releases/obmin_latest_all.deb /home/obmin/releases \
    && cp -r /home/obmin/releases/usr/* /usr \
    && rm -rf /home/obmin/releases

ADD entrypoint.sh /
ADD obmin.config /etc/

RUN chown -R 1000.1000 /home/obmin

RUN mkdir -p $OBMIN_DATA_DIR
RUN chown -R 1000:1000 $OBMIN_DATA_DIR

EXPOSE 8088

ENTRYPOINT ["/entrypoint.sh"]
CMD ["obmin-server"]
USER 1000
WORKDIR /srv/obmin
VOLUME  /srv/obmin
