# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostSignals CXX)

if(MSVC)
  add_definitions(
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4275 # 'boost::noncopyable' used as base for dll-interface class 
    )
endif()

add_library(boost_signals
  src/trackable.cpp
  src/connection.cpp
  src/named_slot_map.cpp
  src/signal_base.cpp
  src/slot.cpp
  )

target_include_directories(boost_signals PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  )

target_link_libraries(boost_signals PUBLIC
  boost::any
  boost::config
  boost::detail
  boost::exception
  boost::function
  boost::type_traits
  boost::iterator
  )

add_library(boost::signals ALIAS boost_signals)
set_property(TARGET boost_signals PROPERTY EXPORT_NAME signals)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_signals EXPORT ${PROJECT_NAME}Targets
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
  Config
  Detail
  Exception
  Function
  TypeTraits
  Iterator
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
