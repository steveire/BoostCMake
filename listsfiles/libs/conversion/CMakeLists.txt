# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostConversion)

add_library(boost_conversion INTERFACE)
add_library(boost::conversion ALIAS boost_conversion)

target_include_directories(boost::conversion INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost::conversion INTERFACE
  boost::array
  boost::container
  boost::math::special_functions
  boost::numeric::conversion
  boost::range
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost::conversion EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
