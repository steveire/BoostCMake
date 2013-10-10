# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostAccumulators)

add_subdirectory(test)

add_library(boost_accumulators INTERFACE)
add_library(boost::accumulators ALIAS boost_accumulators)
set_property(TARGET boost_accumulators PROPERTY EXPORT_NAME accumulators)

target_include_directories(boost_accumulators INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_accumulators INTERFACE
  boost::fusion
  boost::parameter
  boost::ublas
  boost::random
  boost::tuple
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_accumulators EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

write_config_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
  Fusion
  Parameter
  UBLAS
  Random
  Tuple
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
