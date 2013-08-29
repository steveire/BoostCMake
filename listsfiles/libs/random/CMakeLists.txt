# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostRandom CXX)

add_library(boost_random INTERFACE)
add_library(boost::random ALIAS boost_random)

target_include_directories(boost_random INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_random INTERFACE
  boost::config
  )

add_library(boost_random
  src/random_device.cpp
  )

target_link_libraries(boost_random PUBLIC
  boost::random
  boost::exception
  )

add_library(boost::random::device ALIAS boost_random)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_random boost_random EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
