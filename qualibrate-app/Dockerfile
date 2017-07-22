FROM jboss/wildfly:10.1.0.Final


# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 10.1.0.Final
ENV WILDFLY_SHA1 9ee3c0255e2e6007d502223916cefad2a1a5e333
ENV JBOSS_HOME /opt/jboss/wildfly
ENV QUALIBRATE_VERSION 2.3.1
ENV QUALIBRATE_KEYSTORE keystore.jks
ENV QUALIBRATE_APP QFP-2.3.1.ear
ENV WILDFLY_SETUP_SCRIPT setup.cli
ENV WILDFLY_CLI_USER admin
ENV WILDFLY_CLI_PASSWORD admin

RUN /opt/jboss/wildfly/bin/add-user.sh admin admin --silent

# Adding files for WildFly setup
# and credentials repository
ADD $WILDFLY_SETUP_SCRIPT /tmp/$WILDFLY_SETUP_SCRIPT
ADD $QUALIBRATE_KEYSTORE /opt/jboss/wildfly/standalone/configuration/${QUALIBRATE_KEYSTORE}
ADD $QUALIBRATE_APP /tmp/${QUALIBRATE_APP}

# Download external libraries
RUN cd /tmp \
    && curl -O http://central.maven.org/maven2/mysql/mysql-connector-java/5.1.22/mysql-connector-java-5.1.22.jar \
    && curl -O http://central.maven.org/maven2/com/h2database/h2/1.4.193/h2-1.4.193.jar

USER root
RUN mkdir -p /opt/qfp_data/attachments/1/1
RUN mkdir -p /opt/qfp_data/screenshots/1/1
RUN mkdir -p /opt/qfp_data/profiles/1
RUN chmod 777 -R /opt/qfp_data

USER jboss
# Expose the ports we're interested in
EXPOSE 9990 8443

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]

