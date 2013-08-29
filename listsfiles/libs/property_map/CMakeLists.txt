# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostPropertyMap NONE)

add_library(boost_property_map INTERFACE)
add_library(boost::property_map ALIAS boost_property_map)

target_include_directories(boost_property_map INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_property_map EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
