# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostAtomic CXX)

include(Ryppl)

ryppl_find_and_use_package(BoostInteger)

include_directories(include)

add_library(boost_atomic
  src/lockpool.cpp
  )

set_target_properties(boost_atomic PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${BoostAtomic_SOURCE_DIR}/include"
  )

ryppl_export(
  TARGETS
    boost_atomic
  DEPENDS
    BoostInteger
  INCLUDE_DIRECTORIES
    include
  )
