# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostArray)

add_subdirectory(test)

add_library(boost_array INTERFACE)
add_library(boost::array ALIAS boost_array)

target_include_directories(boost_array INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_array INTERFACE
  boost::exception
  boost::functional
  boost::utility
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_array EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
