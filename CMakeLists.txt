CMAKE_MINIMUM_REQUIRED (VERSION 2.6)
PROJECT(boilerplate)

INCLUDE_DIRECTORIES(src)
INCLUDE_DIRECTORIES(include)
INCLUDE_DIRECTORIES(third-party)

ADD_LIBRARY(core include/Core.h src/Core.cpp)
ADD_EXECUTABLE(boilerplate src/Main.cpp)

enable_testing()

add_subdirectory(third-party/googletest)

include_directories(${gtest_SOURCE_DIR}/include ${gtest_SOURCE_DIR})
include_directories(${gmock_SOURCE_DIR}/include ${gmock_SOURCE_DIR})

# Tests. *-test.cpp should be added here.
add_executable(tests test/CoreTests.cpp)

# Link core, pthread and gtest to tests.
target_link_libraries(tests
        pthread
        gtest
        gtest_main
        core)

TARGET_LINK_LIBRARIES(boilerplate core)

SET(CMAKE_CXX_FLAGS "-g -Wall -Werror -std=c++11")