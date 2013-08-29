# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostIntrusive NONE)

add_library(boost_intrusive INTERFACE)
add_library(boost::intrusive ALIAS boost_intrusive)
set_property(TARGET boost_intrusive PROPERTY EXPORT_NAME intrusive)

target_include_directories(boost_intrusive INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_intrusive EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
