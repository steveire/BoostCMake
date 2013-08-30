# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostDetail)

add_library(boost_detail INTERFACE)
add_library(boost::detail ALIAS boost_detail)
set_property(TARGET boost_detail PROPERTY EXPORT_NAME detail)

target_include_directories(boost_detail INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  )

target_link_libraries(boost_detail INTERFACE
  boost::bind
  boost::config
  boost::predef
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_detail EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

write_config_file("${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
  Bind
  Config
  Predef
  )
write_basic_package_version_file("${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  VERSION ${BOOST_VERSION}
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION lib/cmake/${PROJECT_NAME}
)
