# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostDynamicBitset)

add_library(boost_dynamic_bitset INTERFACE)
add_library(boost::dynamic_bitset ALIAS boost_dynamic_bitset)
set_property(TARGET boost_dynamic_bitset PROPERTY EXPORT_NAME dynamic_bitset)

target_include_directories(boost_dynamic_bitset INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_dynamic_bitset EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
