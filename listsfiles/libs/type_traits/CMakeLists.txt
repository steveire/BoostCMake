# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostTypeTraits NONE)

add_library(boost_type_traits INTERFACE)
add_library(boost::type_traits ALIAS boost_type_traits)
set_property(TARGET boost_type_traits PROPERTY EXPORT_NAME type_traits)

target_include_directories(boost_type_traits INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_type_traits INTERFACE
  boost::mpl
  boost::typeof
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_type_traits EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
