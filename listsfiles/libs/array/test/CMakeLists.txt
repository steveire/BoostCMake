# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

set(tests_list
  array0
  array1
  array2
  array3
  array4
  array5
  array6
  array7
  array_hash
  )

foreach(test IN LISTS tests_list)
  string(TOLOWER "${PROJECT_NAME}-test-${test}" target)
  add_executable(${target} ${test})
  target_link_libraries(${target} PRIVATE
    boost::array
    boost::unit_test_framework
    )
  add_test(NAME ${PROJECT_NAME}.${test}
    COMMAND $<TARGET_FILE:${target}>
    )
endforeach()
