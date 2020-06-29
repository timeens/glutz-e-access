FROM ubuntu:latest

# env variables
ENV DOWNLOAD_LINK="https://glutz.com/service/downloads/?dwnldid=97483"
ENV DB_NAME="database.gax"

# create alias
RUN echo 'alias glutz="/glutz/server/Desktop/eAccessServer"' >> ~/.bashrc

RUN apt -y update && apt -y install wget systemctl libglib2.0-0 libgl1-mesa-glx libdbus-1-3
RUN mkdir /glutz
WORKDIR /glutz

# download and extract glutz software
RUN wget -O glutz.tar.gz $DOWNLOAD_LINK
RUN mkdir server && tar xf glutz.tar.gz --strip-components 1 -C server
RUN rm glutz.tar.gz

# install rules
RUN bash server/install_udev_rules.sh

# run
ENTRYPOINT ["glutz --auto-convert --auto-reclaim /glutz/db-data/$DB_NAME"]