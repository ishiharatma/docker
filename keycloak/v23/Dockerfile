FROM registry.access.redhat.com/ubi9 AS ubi-micro-build
RUN mkdir -p /mnt/rootfs
RUN dnf upgrade \
 && dnf install -y glibc-langpack-en gzip hostname java-17-openjdk-headless openssl tar which \
 && dnf clean all

# https://quay.io/repository/keycloak/keycloak?tab=tags
# Keycloak のバージョンを変更したら buildspec.yml の keycloak_version も修正すること
FROM quay.io/keycloak/keycloak:23.0.6
COPY --from=ubi-micro-build /mnt/rootfs /
# https://hub.docker.com/r/keycloak/keycloak/tags
#FROM keycloak/keycloak:22.0.4
USER root
#
#RUN microdnf update -y && microdnf install -y glibc-langpack-en gzip hostname java-11-openjdk-headless openssl tar which && microdnf clean all
# 22.0.4 アップグレード時に変更
#RUN microdnf update -y && microdnf install -y glibc-langpack-en gzip hostname java-17-openjdk-headless openssl tar which && microdnf clean all
#
USER 1000
#
EXPOSE 8080
#EXPOSE 8443

COPY ./themes/elpit /opt/keycloak/themes/elpit

COPY ./cache-ispn-jdbc-ping.xml /opt/keycloak/conf/cache-ispn-jdbc-ping.xml

RUN rm -f /opt/keycloak/conf/cache-ispn.xml