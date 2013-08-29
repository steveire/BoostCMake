# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostTimer CXX)

add_library(boost_timer::header_only INTERFACE)
add_library(boost::timer::header_only ALIAS boost_timer::header_only)
target_include_directories(boost_timer::header_only INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

add_library(boost_timer
  src/auto_timers_construction.cpp
  src/cpu_timer.cpp
  )


target_link_libraries(boost_timer PUBLIC
  boost::timer::header_only
  boost::chrono
  boost::io
  )

add_library(boost::timer ALIAS boost_timer)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS
    boost::timer::header_only
    boost_timer
  EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
