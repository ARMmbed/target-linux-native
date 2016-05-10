# Copyright (C) 2014-2015 ARM Limited. All rights reserved.

cmake_minimum_required(VERSION 2.8)

# default to C99
set(CMAKE_C_FLAGS "-std=c99" CACHE STRING "")
set(CMAKE_CXX_FLAGS "-std=gnu++11" CACHE STRING "")

set(CMAKE_C_LINK_EXECUTABLE       "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> ${GLOBALLY_LINKED_TARGET_LIBS} -lm -lc -lgcc -lm -lc -lgcc -Wl,--end-group -o <TARGET>")
set(CMAKE_CXX_LINK_EXECUTABLE     "<CMAKE_CXX_COMPILER> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS>  -Wl,--start-group <OBJECTS> <LINK_LIBRARIES> ${GLOBALLY_LINKED_TARGET_LIBS} -lstdc++ -lsupc++ -lm -lc -lgcc -lstdc++ -lsupc++ -lm -lc -lgcc -Wl,--end-group -o <TARGET>")

# check that we are actually running on Linux, if we're not then we may pull in
# incorrect dependencies.
if(NOT (${CMAKE_HOST_SYSTEM_NAME} MATCHES "Linux"))
    message(FATAL_ERROR "This Linux native target will not work on non-Linux platforms (your platform is ${CMAKE_HOST_SYSTEM_NAME}), use `yotta target` to set the target.")
endif()

