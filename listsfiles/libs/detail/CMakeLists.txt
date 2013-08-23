# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostDetail)

add_library(boost::detail INTERFACE)

target_include_directories(boost::detail INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

target_link_libraries(boost::detail INTERFACE
  boost::bind
  boost::config
  boost::predef
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost::detail EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
