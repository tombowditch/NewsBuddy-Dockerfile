# Use phusion/baseimage as base image.
FROM phusion/baseimage:0.9.22

# Set environment variables.
ENV HOME /root

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

#ADD get-wget-lua.sh /

# Add archiveteam user
RUN adduser --system --group --shell /bin/bash archiveteam
RUN echo "archiveteam ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Install needed stuff
RUN apt-get update && apt-get install -y git-core libgnutls-dev screen python-dev python-pip bzip2 zlib1g-dev unzip wget openssl libssl-dev youtube-dl

# Pip
RUN pip install --upgrade seesaw requests youtube-dl warcio

# Download newsgrabber warrior
RUN su -c "cd /home/archiveteam; git clone https://github.com/ArchiveTeam/NewsGrabber-Warrior.git" archiveteam

# wpull magic

RUN su -c "cd /home/archiveteam/NewsGrabber-Warrior/; wget https://launchpad.net/wpull/trunk/v1.2.3/+download/wpull-1.2.3-linux-x86_64-3.4.3-20160302011013.zip; unzip wpull-1.2.3-linux-x86_64-3.4.3-20160302011013.zip; chmod +x ./wpull" archiveteam

EXPOSE 8888

RUN mkdir /etc/service/news
ADD boot.sh /etc/service/news/run

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
