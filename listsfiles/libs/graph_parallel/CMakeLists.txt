# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostGraphParallel CXX)

if(MSVC)
  add_definitions(
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4275 # non dll-interface class used as base for dll-interface class
    /wd4800 # forcing value to bool 'true' or 'false' (performance warning)
    )
endif()

add_library(boost_graph_parallel
  src/mpi_process_group.cpp
  src/tag_allocator.cpp
  )

target_include_directories(boost_graph_parallel PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_graph_parallel PUBLIC
  boost::graph
  boost::mpi
  )

add_library(boost::graph::parallel ALIAS boost_graph_parallel)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_graph_parallel EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
