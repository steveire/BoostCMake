# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostRandom CXX)

add_library(boost_random INTERFACE)
add_library(boost::random ALIAS boost_random)
set_property(TARGET boost_random PROPERTY EXPORT_NAME random)

target_include_directories(boost_random INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_random INTERFACE
  boost::config
  )

add_library(boost_random_device
  src/random_device.cpp
  )

target_link_libraries(boost_random_device PUBLIC
  boost::random
  boost::exception
  )

add_library(boost::random::device ALIAS boost_random_device)
set_property(TARGET boost_random_device PROPERTY EXPORT_NAME random::device)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_random boost_random_device EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

write_config_file("${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
  Config
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
