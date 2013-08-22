# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostAlgorithm)

#add_subdirectory(test)

add_library(boost::algorithm INTERFACE)
set_property(TARGET boost::algorithm PROPERTY INTERFACE_INCLUDE_DIRECTORIES
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

ryppl_export(
  DEPENDS
    BoostArray
    BoostConceptCheck
    BoostConfig
    BoostDetail
    BoostException
    BoostFunction
    BoostIterator
    BoostMPL
    BoostRange
    BoostStaticAssert
    BoostTR1
    BoostTuple
    BoostTypeTraits
    BoostUtility
  RECOMMENDS
    BoostRegex
  INCLUDE_DIRECTORIES
    include
  )
