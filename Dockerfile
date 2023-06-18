# Pull base image.
FROM ubuntu:20.04

WORKDIR /app
COPY ./lns lns
COPY ./random-32-32-20.map random-32-32-20.map
COPY ./random-32-32-20-random-1.scen random-32-32-20-random-1.scen  
COPY ./instances instances
RUN ls -la

RUN ./lns -m random-32-32-20.map -a random-32-32-20-random-1.scen -o test -k 400 -t 300 --outputPaths=paths.txt