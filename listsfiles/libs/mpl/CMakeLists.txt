# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostMPL NONE)

add_library(boost_mpl INTERFACE)
add_library(boost::mpl ALIAS boost_mpl)

target_include_directories(boost_mpl INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_mpl INTERFACE
  boost::preprocessor
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost::mpl EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
