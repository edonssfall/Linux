FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y curl && \
    curl -s https://deb.nodesource.com/setup_18.x | bash && \
    apt-get install -y nodejs && \
    npm install -g @angular/cli

CMD ["sleep", "infinity"]
