# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostGraph CXX)

add_library(boost_graph
  src/read_graphviz_new.cpp
  src/graphml.cpp
  )

target_include_directories(boost_graph PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

target_link_libraries(boost_graph PUBLIC
  boost::any
  boost::algorithm
  boost::serialization
  boost::config
  boost::detail
  boost::foreach
  boost::function
  boost::fusion
  boost::exception
  boost::concept_check
  boost::conversion
  boost::regex
  boost::unordered
  boost::multi_index
  boost::parameter
  boost::property_map
  boost::property_tree
  boost::xpressive
  boost::tuple
  boost::typeof
  )

add_library(boost::graph ALIAS boost_graph)
set_property(TARGET boost_graph PROPERTY EXPORT_NAME graph)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_graph EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )

write_config_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
  Any
  Algorithm
  Serialization
  Config
  Detail
  Foreach
  Function
  Fusion
  Exception
  ConceptCheck
  Conversion
  Regex
  Unordered
  MultiIndex
  Parameter
  PropertyMap
  PropertyTree
  Xpressive
  Tuple
  Typeof
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

export(TARGETS 
  NAMESPACE boost::
  FILE ${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Targets.cmake)
