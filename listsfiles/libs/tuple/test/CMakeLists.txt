# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt
include(Ryppl)
include(RypplTestSuite)

ryppl_find_and_use_package(BoostConfig)
ryppl_find_and_use_package(BoostTest)

ryppl_test_suite(
  RUN
    tuple_test_bench.cpp
    io_test.cpp
    another_tuple_test_bench.cpp
  LINK_LIBRARIES
    boost_test_exec_monitor
  NO_SINGLE_TARGET
  )
