if [[ -d /tmp/boost ]] 
then
    echo "Boost already installed"
else
    mkdir -p /tmp/boost
    wget -c https://boostorg.jfrog.io/artifactory/main/release/1.82.0/source/boost_1_82_0.tar.gz -O - | tar -xz -C /tmp/boost
    /tmp/boost/boost_1_82_0/bootstrap.sh --prefix=/tmp/boost
    /tmp/boost/boost_1_82_0/b2 install
fi


if [[ -d inc/eigen3 ]] 
then
    echo "Eigen3 already installed"
else
    rm -r /tmp/eigen3
    mkdir -p /tmp/eigen3
    mkdir -p inc
    wget -c https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz -O - | tar -xz -C /tmp/eigen3
    mv /tmp/eigen3/eigen-3.4.0/ inc/eigen3
fi