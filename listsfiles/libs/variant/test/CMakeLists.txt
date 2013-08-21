# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt
include(Ryppl)
include(RypplTestSuite)

ryppl_find_and_use_package(BoostConfig)
ryppl_find_and_use_package(BoostTest)
ryppl_find_and_use_package(BoostVariant)

if(MSVC)
  add_definitions(
    /EHa    # <toolset>msvc:<asynch-exceptions>on
    ) 
endif()

ryppl_test_suite(
 RUN 
  test1.cpp 
  test4.cpp
 ADDITIONAL_SOURCES
  class_a.cpp
 NO_SINGLE_TARGET 
 )

ryppl_test_suite(
  RUN
    test2.cpp
    test3.cpp
    test5.cpp
    test6.cpp
    test7.cpp
    test8.cpp
    recursive_variant_test.cpp
    variant_reference_test.cpp
    variant_comparison_test.cpp
    variant_visit_test.cpp
  NO_SINGLE_TARGET
  )

