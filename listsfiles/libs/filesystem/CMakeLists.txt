# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostFilesystem CXX)

add_library(boost_filesystem
  src/operations.cpp
  src/path.cpp
  src/portability.cpp
  src/utf8_codecvt_facet.cpp
  src/codecvt_error_category.cpp
  src/path_traits.cpp
  src/unique_path.cpp
  src/windows_file_codecvt.cpp
  )

target_include_directories(boost_filesystem PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_filesystem PUBLIC
  boost::system
  boost::exception
  boost::functional
  boost::type_traits
  boost::range
  boost::io
  boost::smart_ptr
  )

add_library(boost::filesystem ALIAS boost_filesystem)
set_property(TARGET boost_filesystem PROPERTY EXPORT_NAME filesystem)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_filesystem EXPORT ${PROJECT_NAME}Targets
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
  System
  Exception
  Functional
  TypeTraits
  Range
  IO
  SmartPtr
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
