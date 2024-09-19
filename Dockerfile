FROM debian:buster-slim
MAINTAINER KP Infotech <poojan@kpinfo.tech>

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    figlet \
    inotify-tools \
    awscli

RUN figlet 'Inotify Custom Image'\
    && figlet 'KP Infotech'

COPY start.sh /start.sh
COPY sync.sh /sync.sh

RUN chmod +x /start.sh \
    && chmod +x /sync.sh


CMD ["/start.sh"]