FROM phusion/baseimage:0.9.22

ENV HOME /root

CMD ["/sbin/my_init"]

RUN adduser --system --group --shell /bin/bash archiveteam
RUN echo "archiveteam ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get update && apt-get install -y git-core libgnutls-dev screen python-dev python-pip bzip2 zlib1g-dev unzip wget openssl libssl-dev youtube-dl

RUN pip install --upgrade seesaw requests youtube-dl warcio

RUN su -c "cd /home/archiveteam; git clone https://github.com/ArchiveTeam/NewsGrabber-Warrior.git" archiveteam

RUN su -c "cd /home/archiveteam/NewsGrabber-Warrior/; wget https://launchpad.net/wpull/trunk/v1.2.3/+download/wpull-1.2.3-linux-x86_64-3.4.3-20160302011013.zip; unzip wpull-1.2.3-linux-x86_64-3.4.3-20160302011013.zip; chmod +x ./wpull" archiveteam

EXPOSE 8888

RUN mkdir /etc/service/news
ADD boot.sh /etc/service/news/run

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
