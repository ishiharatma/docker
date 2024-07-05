# https://quay.io/repository/keycloak/keycloak?tab=tags
FROM quay.io/keycloak/keycloak:18.0.2
USER root
#
RUN microdnf update -y && microdnf install -y glibc-langpack-en gzip hostname java-11-openjdk-headless openssl tar which && microdnf clean all
#
USER 1000
#
EXPOSE 8080
#EXPOSE 8443

#COPY ./themes/yourcustomtheme /opt/keycloak/themes/yourcustomtheme

COPY ./cache-ispn-jdbc-ping.xml /opt/keycloak/conf/cache-ispn-jdbc-ping.xml
RUN rm -f /opt/keycloak/conf/cache-ispn.xml