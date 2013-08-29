# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostUnordered NONE)

add_library(boost_unordered INTERFACE)
add_library(boost::unordered ALIAS boost_unordered)
set_property(TARGET boost_unordered PROPERTY EXPORT_NAME unordered)

target_include_directories(boost_unordered INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_unordered INTERFACE
  boost::move
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_unordered EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
