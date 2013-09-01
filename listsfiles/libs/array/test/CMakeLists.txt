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

set(test_targets)
foreach(test IN LISTS tests_list)
  set(target "${PROJECT_NAME}-test-${test}")
  add_executable(${target} ${test})
  target_link_libraries(${target} PRIVATE
    boost::array
    boost::unit_test_framework
    )
  list(APPEND test_targets ${target})
  add_test(NAME ${PROJECT_NAME}.${test}
    COMMAND $<TARGET_FILE:${target}>
    )
endforeach()

add_custom_target(${PROJECT_NAME}-test
  COMMAND ${CMAKE_CTEST_COMMAND} -R "^${PROJECT_NAME}" ${CMAKE_BINARY_DIR}
  DEPENDS ${test_targets}
  )
