CMAKE_MINIMUM_REQUIRED (VERSION 2.6)

PROJECT(boilerplate)

ADD_LIBRARY(core core.h core.cpp)
ADD_EXECUTABLE(boilerplate main.cpp core)

TARGET_LINK_LIBRARIES(boilerplate core)

SET(CMAKE_CXX_FLAGS "-g -Wall -Werror -std=c++11")