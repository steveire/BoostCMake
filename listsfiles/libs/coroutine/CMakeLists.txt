# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostCoroutine CXX)

add_subdirectory(test)

if(WIN32)
  set(allocator_sources
    src/detail/standard_stack_allocator_windows.cpp
    )
else()
  set(allocator_sources
    src/detail/standard_stack_allocator_posix.cpp
    )
  if(CMAKE_COMPILER_IS_GNUCXX AND "${CMAKE_CXX_COMPILER_VERSION}" VERSION_GREATER "4.7")
    list(APPEND allocator_sources
      src/detail/segmented_stack_allocator.cpp
      )
    add_definitions(-DBOOST_USE_SEGMENTED_STACKS)
  endif()
endif()

add_library(boost_coroutine
  ${allocator_sources}
  src/detail/coroutine_context.cpp
  src/exceptions.cpp
  )

target_include_directories(boost_coroutine PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  )

target_link_libraries(boost_coroutine PUBLIC
  boost::context
  boost::system
  boost::type_traits
  )

add_library(boost::coroutine ALIAS boost_coroutine)
set_property(TARGET boost_coroutine PROPERTY EXPORT_NAME coroutine)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_coroutine EXPORT ${PROJECT_NAME}Targets
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
  Context
  System
  TypeTraits
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

export(TARGETS boost_coroutine
  NAMESPACE boost::
  FILE ${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Targets.cmake)
