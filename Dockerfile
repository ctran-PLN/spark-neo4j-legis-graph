FROM kbastani/docker-neo4j:latest

# fix jessie-backports failed update
RUN rm /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get update && \
    apt-get install -y python3-pip python3-dev

ARG workdir=/var/lib/neo4j-community-2.2.3

ADD ./legis-graph $workdir/legis-graph
