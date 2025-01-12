FROM debian:buster-slim
MAINTAINER KP Infotech <poojan@kpinfo.tech>

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    figlet \
    awscli

RUN figlet 'Filestore-sync Custom Image'\
    && figlet 'KP Infotech'

COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]