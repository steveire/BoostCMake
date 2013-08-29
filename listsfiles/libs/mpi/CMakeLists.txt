# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostMPI CXX)

find_package(MPI REQUIRED)

if(MSVC)
  add_definitions(
    /D_SCL_SECURE_NO_WARNINGS
    /wd4251 # class needs to have dll-interface to be used by clients
    /wd4275 # non dll-interface class used as base for dll-interface class
    /wd4996 # 'strdup': The POSIX name for this item is deprecated.
    )
endif()

add_library(boost_mpi
  src/broadcast.cpp
  src/communicator.cpp
  src/computation_tree.cpp
  src/content_oarchive.cpp
  src/environment.cpp
  src/exception.cpp
  src/graph_communicator.cpp
  src/group.cpp
  src/intercommunicator.cpp
  src/mpi_datatype_cache.cpp
  src/mpi_datatype_oarchive.cpp
  src/packed_iarchive.cpp
  src/packed_oarchive.cpp
  src/packed_skeleton_iarchive.cpp
  src/packed_skeleton_oarchive.cpp
  src/point_to_point.cpp
  src/request.cpp
  src/text_skeleton_oarchive.cpp
  src/timer.cpp
  )

target_include_directories(boost_mpi PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  ${MPI_INCLUDE_PATH}
  )

set_property(TARGET boost_mpi APPEND PROPERTY
  COMPILE_DEFINITIONS BOOST_MPI_SOURCE
  )

target_link_libraries(boost_mpi PUBLIC
  boost::serialization
  boost::concept_check
  boost::graph
  ${MPI_LIBRARIES}
  )

add_library(boost::mpi ALIAS boost_mpi)

add_library(boost_mpi_python
  src/python/serialize.cpp
  )

set_property(TARGET boost_mpi_python APPEND PROPERTY
  COMPILE_DEFINITIONS BOOST_MPI_PYTHON_SOURCE
  )

target_link_libraries(boost_mpi_python
  boost::mpi
  boost::python
  )

add_library(boost::mpi::python ALIAS boost_mpi_python)

if(BUILD_SHARED_LIBS)
  add_library(boost_mpi-py MODULE
    src/python/collectives.cpp
    src/python/py_communicator.cpp
    src/python/datatypes.cpp
    src/python/documentation.cpp
    src/python/py_environment.cpp
    src/python/py_nonblocking.cpp
    src/python/py_exception.cpp
    src/python/module.cpp
    src/python/py_request.cpp
    src/python/skeleton_and_content.cpp
    src/python/status.cpp
    src/python/py_timer.cpp
    )
  target_link_libraries(boost_mpi-py
    boost::mpi::python
    )
  set_target_properties(boost_mpi-py PROPERTIES
    OUTPUT_NAME mpi
    PREFIX ""
    )
  if(WIN32)
    set_target_properties(boost_mpi-py PROPERTIES
      IMPORT_SUFFIX .pyd
      SUFFIX .pyd
      )
  endif()
endif()

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_mpi boost_mpi_python EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
