# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostParameter NONE)

add_library(boost_parameter INTERFACE)
add_library(boost::parameter ALIAS boost_parameter)
set_property(TARGET boost_parameter PROPERTY EXPORT_NAME parameter)

target_include_directories(boost_parameter INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_parameter EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
