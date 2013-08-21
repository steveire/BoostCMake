# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.8)
project(BoostAccumulators)

add_library(boost::accumulators INTERFACE)

target_include_directories(boost::accumulators PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

#target_link_libraries(boost::accumulators
#  boost::array
#    BoostCircularBuffer
#    BoostConceptCheck
#    BoostConfig
#    BoostDetail
#    BoostException
#    BoostFusion
#    BoostIterator
#    BoostMPL
#    BoostNumericConversion
#    BoostParameter
#    BoostPreprocessor
#    BoostRange
#    BoostStaticAssert
#    BoostTuple
#    BoostTypeTraits
#    BoostTypeof
#    BoostUBLAS
#    BoostUtility
#  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost::accumulators EXPORT ${PROJECT_NAME}Targets)

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
