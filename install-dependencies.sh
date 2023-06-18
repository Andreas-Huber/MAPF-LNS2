if [[ -d /boost ]] 
then
    echo "Boost already installed"
else
    mkdir -p /boost
    wget -c https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz -O - | tar -xz -C /boost
    cd /boost/boost_1_82_0/
    ./bootstrap.sh --prefix=/boost
    ./b2 install
fi


if [[ -d /src/inc/eigen3 ]] 
then
    echo "Eigen3 already installed"
else
    rm -r /tmp/eigen3
    mkdir -p /tmp/eigen3
    mkdir -p /src/inc/eigen3
    wget -c https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz -O - | tar -xz -C /tmp/eigen3
    mv /tmp/eigen3/eigen-3.4.0/* /src/inc/eigen3
fi