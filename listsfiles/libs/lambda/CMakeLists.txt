# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostLambda NONE)

add_library(boost_lambda INTERFACE)
add_library(boost::lambda ALIAS boost_lambda)
set_property(TARGET boost_lambda PROPERTY EXPORT_NAME lambda)

target_include_directories(boost_lambda INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_lambda EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
