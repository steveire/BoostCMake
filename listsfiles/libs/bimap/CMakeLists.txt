# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostBimap)

add_library(boost_bimap INTERFACE)
add_library(boost::bimap ALIAS boost_bimap)
set_property(TARGET boost_bimap PROPERTY EXPORT_NAME bimap)

target_include_directories(boost_bimap INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_bimap EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
