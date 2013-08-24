# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostAtomic CXX)

add_library(boost_atomic
  src/lockpool.cpp
  )

target_include_directories(boost_atomic PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_atomic PUBLIC
  boost::config
  boost::detail
  boost::type_traits
  boost::integer
  boost::smart_ptr
  )

add_library(boost::atomic ALIAS boost_atomic)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_atomic EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
