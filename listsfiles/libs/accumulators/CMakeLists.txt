# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostAccumulators)

add_subdirectory(test)

add_library(boost_accumulators INTERFACE)
add_library(boost::accumulators ALIAS boost_accumulators)
set_property(TARGET boost_accumulators PROPERTY EXPORT_NAME accumulators)

target_include_directories(boost_accumulators INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_accumulators INTERFACE
  boost::fusion
  boost::parameter
  boost::ublas
  boost::random
  boost::tuple
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_accumulators EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
