# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostInteger NONE)

add_library(boost_integer INTERFACE)
add_library(boost::integer ALIAS boost_integer)
set_property(TARGET boost_integer PROPERTY EXPORT_NAME integer)

target_include_directories(boost_integer INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_integer INTERFACE
  boost::static_assert
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_integer EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
