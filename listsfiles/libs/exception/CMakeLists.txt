# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostException NONE)

add_library(boost_exception INTERFACE)
add_library(boost::exception ALIAS boost_exception)
set_property(TARGET boost_exception PROPERTY EXPORT_NAME exception)

target_include_directories(boost_exception INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_exception INTERFACE
  boost::detail
  boost::units
  boost::utility
  boost::tuple
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_exception EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
