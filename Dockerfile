FROM ubuntu:18.04 as build

RUN apt update
RUN apt install wget cmake make -y 

WORKDIR /src
COPY ./install-dependencies.sh install-dependencies.sh
RUN ./install-dependencies.sh

COPY . .
RUN ls -la /src/*


RUN ./build.sh


FROM ubuntu:18.04 as test
WORKDIR /app
COPY --from=build /src/lns lns
COPY ./random-32-32-20.map random-32-32-20.map
COPY ./random-32-32-20-random-1.scen random-32-32-20-random-1.scen  
COPY ./instances instances
RUN ls -la

#RUN ./lns -m random-32-32-20.map -a random-32-32-20-random-1.scen -o test -k 400 -t 300 --outputPaths=paths.txt