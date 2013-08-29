# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostNumericConversion NONE)

add_library(boost_numeric_conversion INTERFACE)
add_library(boost::numeric::conversion ALIAS boost_numeric_conversion)
set_property(TARGET boost_numeric_conversion PROPERTY EXPORT_NAME numeric::conversion)

target_include_directories(boost_numeric_conversion INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_numeric_conversion EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
