# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostUBLAS NONE)

add_library(boost_ublas INTERFACE)
add_library(boost::ublas ALIAS boost_ublas)

target_include_directories(boost_ublas INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_ublas INTERFACE
  boost::typeof
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost::ublas EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
