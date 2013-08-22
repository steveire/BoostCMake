# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

#if(MSVC)
#  add_definitions(-D_HAS_ITERATOR_DEBUGGING=0)
#endif()

set(test_list
  count
  covariance
  droppable
  error_of
  extended_p_square
  extended_p_square_quantile
  external_accumulator
  external_weights
  kurtosis
  max
  mean
  median
  min
  moment
  pot_quantile
  p_square_cumul_dist
  p_square_quantile
  reference
  skewness
  sum
  tail
  tail_mean
  tail_quantile
  tail_variate_means
  valarray
  variance
  vector
  weighted_covariance
  weighted_extended_p_square
  weighted_kurtosis
  weighted_mean
  weighted_median
  weighted_moment
  weighted_p_square_cumul_dist
  weighted_p_square_quantile
  weighted_skewness
  weighted_sum
  weighted_variance
  weighted_pot_quantile
  weighted_tail_mean
  weighted_tail_quantile
  weighted_tail_variate_means
  )

foreach(test IN LISTS test_list)
  string(TOLOWER "${PROJECT_NAME}-test-${test}" target)
  add_executable(${target} ${test})
  target_link_libraries(${target} PRIVATE
    boost::accumulators
    boost::serialization
    boost::unit_test_framework
    )
  add_test(NAME ${PROJECT_NAME}.${test}
    COMMAND $<TARGET_FILE:${target}>
    )
endforeach()
