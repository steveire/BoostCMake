# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

include(Ryppl)
include(RypplTestSuite)

ryppl_find_and_use_package(BoostConfig)
ryppl_find_and_use_package(BoostTest)

if(MSVC)
   add_definitions(/WX)
elseif(CMAKE_COMPILER_IS_GNUCXX)
   add_definitions(
      -Wextra
      -Wno-uninitialized
      -Werror
      )
elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "Intel")
   add_definitions(-Werror)
elseif("${CMAKE_CXX_COMPILER_ID}" MATCHES "Sun")
   add_definitions(-errwarn=%all)
endif()

file(GLOB sources *_test.cpp)
ryppl_test_suite(
   RUN ${sources}
   COMPILE_FAIL common_type_fail.cpp
   NO_SINGLE_TARGET
   )
