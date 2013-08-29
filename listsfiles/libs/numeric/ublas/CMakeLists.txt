# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostUBLAS NONE)

add_library(boost_ublas INTERFACE)
add_library(boost::ublas ALIAS boost_ublas)
set_property(TARGET boost_ublas PROPERTY EXPORT_NAME ublas)

target_include_directories(boost_ublas INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_ublas INTERFACE
  boost::typeof
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_ublas EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
