cmake_minimum_required(VERSION 3.9.1)
project(webrtc_app)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic")

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/Modules)

if (USE_DATACHANNEL)
    find_package(LibDataChannel 0.21.0 REQUIRED)
else()
    add_subdirectory(ext/libdatachannel EXCLUDE_FROM_ALL)
endif()

add_executable(webrtc_app
src/http_async.cpp
)

target_link_libraries(webrtc_app PRIVATE LibDataChannel::LibDataChannel)