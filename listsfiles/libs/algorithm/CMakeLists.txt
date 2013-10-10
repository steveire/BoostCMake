# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostAlgorithm)

add_library(boost_algorithm INTERFACE)
add_library(boost::algorithm ALIAS boost_algorithm)
set_property(TARGET boost_algorithm PROPERTY EXPORT_NAME algorithm)

target_include_directories(boost_algorithm INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_algorithm INTERFACE
  boost::range
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_algorithm EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

write_config_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
  Range
  )
write_basic_package_version_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
  VERSION ${BOOST_VERSION}
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION lib/cmake/${PROJECT_NAME}
)
