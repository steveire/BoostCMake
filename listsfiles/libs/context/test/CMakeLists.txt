# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

add_executable(boostcontext-test
  test_context.cpp
  )

target_link_libraries(boostcontext-test
  boost::unit_test_framework
  boost::context
  )

add_test(NAME ${PROJECT_NAME}.test
  COMMAND $<TARGET_FILE:boostcontext-test>
  )
