# Pull base image.
FROM dockerfile/nodejs-bower-grunt
MAINTAINER Fábio Uechi <fabio.uechi@gmail.com>

# Install.
RUN \
  apt-get update &&\ 
  apt-get install -y curl git zsh

# Install oh my zhs
ENV ZSH /root/.oh-my-zsh
RUN curl -L http://install.ohmyz.sh | zsh

ADD root/.zshrc /root/.zshrc

#Install appengine python sdk
RUN \
   wget https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.15.zip -P /tmp/ &&\
   mkdir -p /usr/local/google &&\
   unzip /tmp/google_appengine_1.9.15.zip -d /usr/local/google/ &&\
   rm -rf /tmp/google_appengine_1.9.15.zip

EXPOSE 8080

# Define default command.
CMD ["zsh"]