# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostRange NONE)

add_library(boost_range INTERFACE)
add_library(boost::range ALIAS boost_range)

target_include_directories(boost_range INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_range INTERFACE
  boost::concept_check
  boost::iterator
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_range EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
