# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

add_executable(boostcoroutine-test
  test_coroutine.cpp
  )

target_link_libraries(boostcoroutine-test
  boost::unit_test_framework
  boost::coroutine
  boost::foreach
  boost::move
  )

add_test(NAME ${PROJECT_NAME}.test
  COMMAND $<TARGET_FILE:boostcoroutine-test>
  )
