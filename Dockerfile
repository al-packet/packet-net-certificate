
FROM debian:buster

RUN apt update
RUN apt install python3-acme python3-certbot python3-mock python3-openssl python3-pkg-resources python3-pyparsing python3-zope.interface -y
RUN apt install certbot -y

COPY startup.sh /usr/local/bin
ENTRYPOINT ["startup.sh"]
CMD ["/bin/bash"]




