project(lns)

cmake_minimum_required (VERSION 3.16)
set (CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -static-libstdc++")

IF(NOT CMAKE_BUILD_TYPE)
    SET(CMAKE_BUILD_TYPE "RELEASE")
ENDIF()

include_directories("inc" "inc/CBS" "inc/PIBT")
file(GLOB SOURCES "src/*.cpp" "src/CBS/*.cpp" "src/PIBT/*.cpp")
add_executable(lns ${SOURCES})

# Find Boost
set(Boost_ROOT /boost) 
set(Boost_INCLUDE_DIR /boost/include)
set(Boost_INCLUDE_DIRS /boost/include)
include_directories( ${Boost_INCLUDE_DIRS} )

set(Boost_USE_STATIC_LIBS   ON)
find_package(Boost REQUIRED COMPONENTS program_options system filesystem)

# Find Eigen3 for PIBT
#find_package (Eigen3 3.3 REQUIRED NO_MODULE)


target_link_libraries(lns ${Boost_LIBRARIES})
