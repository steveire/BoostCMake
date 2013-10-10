# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostInspect CXX)

add_executable(inspect
  apple_macro_check.cpp
  ascii_check.cpp
  assert_macro_check.cpp
  copyright_check.cpp
  crlf_check.cpp
  deprecated_macro_check.cpp
  end_check.cpp
  inspect.cpp
  license_check.cpp
  link_check.cpp
  minmax_check.cpp
  path_name_check.cpp
  tab_check.cpp
  unnamed_namespace_check.cpp
  )

target_link_libraries(inspect PRIVATE
  boost::algorithm
  boost::conversion
  boost::filesystem
  boost::regex
  )

install(TARGETS inspect EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )

export(TARGETS 
  NAMESPACE boost::
  FILE ${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Targets.cmake)
