# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostDateTime)

add_definitions(
  -DDATE_TIME_INLINE
  )

add_library(boost_date_time
  src/gregorian/greg_month.cpp
  src/gregorian/greg_weekday.cpp
  src/gregorian/date_generators.cpp
  )

target_include_directories(boost_date_time PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

target_link_libraries(boost_date_time PRIVATE
  boost::config
  boost::conversion
  boost::concept_check
  boost::detail
  boost::math::special_functions
  boost::type_traits
  boost::integer
  )

add_library(boost::date_time ALIAS boost_date_time)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_date_time EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
