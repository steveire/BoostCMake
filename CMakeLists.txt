# Created by Daniel Pfeifer <daniel@pfeifer-mail.de>
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11 FATAL_ERROR)
project(BoostCMake NONE)

enable_testing()

message(STATUS "Using CMake ${CMAKE_VERSION}")
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/Modules")
find_package(Git REQUIRED)

#execute_process(COMMAND
#  ${CMAKE_SOURCE_DIR}/shallow-clone
#  https://github.com/boostorg/boost.git
#  ${CMAKE_BINARY_DIR}/boost
#  )
file(COPY "listsfiles/" DESTINATION "${CMAKE_BINARY_DIR}/boost")

add_subdirectory("${CMAKE_BINARY_DIR}/boost" "${CMAKE_BINARY_DIR}/boost-build")
