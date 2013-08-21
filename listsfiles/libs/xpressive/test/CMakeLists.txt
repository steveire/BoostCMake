# Distributed under the Boost Software License, Version 1.0.
# See copy at http://www.boost.org/LICENSE_1_0.txt
include(Ryppl)
include(RypplTestSuite)

ryppl_find_and_use_package(BoostConfig)
ryppl_find_and_use_package(BoostTest)
ryppl_find_and_use_package(BoostXpressive)

ryppl_test_suite(
  RUN
    #regress  # <dependency>regress.txt
    #c_traits # <dependency>regress.txt
    test1.cpp
    test2.cpp
    test3.cpp
    test4.cpp
    test5.cpp
    test6.cpp
    test7.cpp
    test8.cpp
    test9.cpp
    test10.cpp
    test11.cpp
    test1u.cpp
    test2u.cpp
    test3u.cpp
    test4u.cpp
    test5u.cpp
    test6u.cpp
    test7u.cpp
    test8u.cpp
    test9u.cpp
    test10u.cpp
    test11u.cpp
    misc1.cpp
    misc2.cpp
    test_format.cpp
    test_cycles.cpp
    test_non_char.cpp
    test_static.cpp
    test_actions.cpp
    test_assert.cpp
    test_assert_with_placeholder.cpp
    test_symbols.cpp
    test_dynamic.cpp
    test_dynamic_grammar.cpp
    test_skip.cpp
  COMPILE
    test_basic_regex.cpp
    test_match_results.cpp
    test_regex_algorithms.cpp
    test_regex_compiler.cpp
    test_regex_constants.cpp
    test_regex_error.cpp
    test_regex_iterator.cpp
    test_regex_primitives.cpp
    test_regex_token_iterator.cpp
    test_regex_traits.cpp
    test_sub_match.cpp
    #test_typeof.cpp
    #test_typeof2.cpp
    multiple_defs1.cpp
    multiple_defs2.cpp
  LINK_LIBRARIES
    boost_unit_test_framework
  NO_SINGLE_TARGET
  )
