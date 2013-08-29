# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostChrono CXX)

if(CMAKE_SYSTEM MATCHES "Linux")
  find_library(RT_LIBRARY rt)
endif() 

add_library(boost_chrono
  src/chrono.cpp
  src/thread_clock.cpp
  src/process_cpu_clocks.cpp
  )

target_include_directories(boost_chrono PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  )

target_link_libraries(boost_chrono PUBLIC
  boost::exception
  boost::math::special_functions
  boost::system
  boost::type_traits
  boost::ratio
  ${RT_LIBRARY}
  )

add_library(boost::chrono ALIAS boost_chrono)
set_property(TARGET boost_chrono PROPERTY EXPORT_NAME chrono)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_chrono EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
