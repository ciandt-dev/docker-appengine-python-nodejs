# Pull base image.
FROM dockerfile/nodejs-bower-grunt
MAINTAINER Fábio Uechi <fabio.uechi@gmail.com>

#Install appengine python sdk
ENV GAE_SDK_VERSION 1.9.15

RUN \
   wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_${GAE_SDK_VERSION}.zip -P /tmp/ &&\
   mkdir -p /usr/local/google &&\
   unzip /tmp/google_appengine_${GAE_SDK_VERSION}.zip -d /usr/local/google/ &&\
   rm -rf /tmp/google_appengine_${GAE_SDK_VERSION}.zip

ENV PATH /usr/local/google/google_appengine:${PATH}

# Define default command.
CMD ["bash"]