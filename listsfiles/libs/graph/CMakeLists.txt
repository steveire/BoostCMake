# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostGraph CXX)

add_library(boost_graph
  src/read_graphviz_new.cpp
  src/graphml.cpp
  )

target_include_directories(boost_graph PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_graph PUBLIC
  boost::any
  boost::algorithm
  boost::serialization
  boost::config
  boost::detail
  boost::foreach
  boost::function
  boost::fusion
  boost::exception
  boost::concept_check
  boost::conversion
  boost::regex
  )

add_library(boost::graph ALIAS boost_graph)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_graph EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
