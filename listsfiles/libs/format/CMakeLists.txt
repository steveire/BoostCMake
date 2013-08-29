# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostFormat NONE)

add_library(boost_format INTERFACE)
add_library(boost::format ALIAS boost_format)

target_include_directories(boost_format INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_format INTERFACE
  boost::optional
  boost::smart_ptr
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost::format EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
