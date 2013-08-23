# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostIOStreams C CXX)

find_package(BZip2)
find_package(ZLIB)

add_definitions(-DBOOST_IOSTREAMS_USE_DEPRECATED)

if(MSVC)
  add_definitions(
    /wd4244 # conversion from 'boost::iostreams::stream_offset' to 'size_t'
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4800 # forcing value to bool 'true' or 'false'
    )
endif()

set(sources
  src/file_descriptor.cpp
  src/mapped_file.cpp
  )

set(link_libraries)

if(ZLIB_FOUND)
  include_directories(${ZLIB_INCLUDE_DIRS})
  list(APPEND sources src/zlib.cpp src/gzip.cpp)
  list(APPEND link_libraries ${ZLIB_LIBRARIES})
endif(ZLIB_FOUND)

if(BZIP2_FOUND)
  include_directories(${BZIP2_INCLUDE_DIR})
  list(APPEND sources src/bzip2.cpp)
  list(APPEND link_libraries ${BZIP2_LIBRARIES})
endif(BZIP2_FOUND)

add_library(boost_iostreams
  ${sources}
  )

target_include_directories(boost_iostreams PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

target_link_libraries(boost_iostreams PUBLIC
  ${link_libraries}
  boost::config
  boost::range
  boost::detail
  boost::exception
  boost::type_traits
  boost::integer
  )

add_library(boost::iostreams ALIAS boost_iostreams)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_iostreams EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
