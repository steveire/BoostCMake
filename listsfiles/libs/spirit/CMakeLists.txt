# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostSpirit NONE)

add_library(boost_spirit INTERFACE)
add_library(boost::spirit ALIAS boost_spirit)

target_include_directories(boost_spirit INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

target_link_libraries(boost_spirit INTERFACE
  boost::optional
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_spirit EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
