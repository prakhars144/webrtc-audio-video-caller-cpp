cmake_minimum_required(VERSION 3.9.1)
project(webrtc_app)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic")

add_executable(webrtc_app
src/http_async.cpp
)
