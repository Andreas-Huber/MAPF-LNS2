FROM ubuntu:18.04 as build

RUN apt update
RUN apt install wget gpg build-essential -y 
# Install newer version of cmake
RUN apt remove cmake -y
RUN apt install libssl-dev -y
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ bionic main' | tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN apt update
RUN apt install cmake  -y

# Compile a specific version of cmake
#WORKDIR /cmake
#RUN wget https://github.com/Kitware/CMake/releases/download/v3.22.1/cmake-3.22.1.tar.gz
#RUN tar zxvf cmake-3.22.1.tar.gz
#WORKDIR /cmake/cmake-3.22.1
#RUN ./bootstrap
#RUN make
#RUN make install



WORKDIR /src
COPY ./install-dependencies.sh install-dependencies.sh
RUN ./install-dependencies.sh
ENV BOOST_ROOT=/boost
RUN export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATHs


COPY . .
RUN ls -la /src/*

RUN cat /boost/include/boost/version.hpp
RUN cat /src/inc/eigen3/Eigen/Core
RUN ./build.sh


FROM ubuntu:18.04 as test
WORKDIR /app
COPY --from=build /src/lns lns
COPY ./random-32-32-20.map random-32-32-20.map
COPY ./random-32-32-20-random-1.scen random-32-32-20-random-1.scen  
COPY ./instances instances
RUN ls -la

RUN ./lns -m random-32-32-20.map -a random-32-32-20-random-1.scen -o test -k 400 -t 3 --outputPaths=paths.txt