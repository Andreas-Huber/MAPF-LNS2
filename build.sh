export BOOST_ROOT=/boost
export BOOST_INCLUDE_DIR=/boost/include
export LD_LIBRARY_PATH=$BOOST_ROOT/lib:$LD_LIBRARY_PATH

cmake -DCMAKE_BUILD_TYPE=RELEASE .
make