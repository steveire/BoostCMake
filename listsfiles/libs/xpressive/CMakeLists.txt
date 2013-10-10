# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostXpressive NONE)

add_library(boost_xpressive INTERFACE)
add_library(boost::xpressive ALIAS boost_xpressive)
set_property(TARGET boost_xpressive PROPERTY EXPORT_NAME xpressive)

target_include_directories(boost_xpressive INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_xpressive INTERFACE
  boost::proto
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_xpressive EXPORT ${PROJECT_NAME}Targets
  INCLUDES DESTINATION include
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

write_config_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
  Proto
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
