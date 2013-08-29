# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostTest CXX)

if(MSVC)
  # specify the asynchronous exception handling model
  string(REGEX REPLACE " ?/EH[as]?c?" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
  set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHa")
endif()

add_library(boost_prg_exec_monitor
  src/execution_monitor.cpp
  src/debug.cpp
  src/cpp_main.cpp
  )

target_include_directories(boost_prg_exec_monitor PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

target_link_libraries(boost_prg_exec_monitor PUBLIC
  boost::algorithm
  boost::config
  boost::detail
  boost::concept_check
  boost::exception
  boost::function
  boost::type_traits
  )

add_library(boost_test_exec_monitor STATIC
  src/compiler_log_formatter.cpp
  src/debug.cpp
  src/decorator.cpp
  src/execution_monitor.cpp
  src/framework.cpp
  src/plain_report_formatter.cpp
  src/progress_monitor.cpp
  src/results_collector.cpp
  src/results_reporter.cpp
  src/test_main.cpp
  src/test_tools.cpp
  src/test_tree.cpp
  src/unit_test_log.cpp
  src/unit_test_main.cpp
  src/unit_test_monitor.cpp
  src/unit_test_parameters.cpp
  src/xml_log_formatter.cpp
  src/xml_report_formatter.cpp
  )

target_include_directories(boost_test_exec_monitor PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

target_link_libraries(boost_test_exec_monitor PRIVATE
  boost::conversion
  boost::algorithm
  boost::math::special_functions
  boost::detail
  boost::concept_check
  boost::timer::header_only
  boost::function
  boost::type_traits
  boost::io
  boost::optional
  )

add_library(boost_unit_test_framework
  src/compiler_log_formatter.cpp
  src/debug.cpp
  src/decorator.cpp
  src/exception_safety.cpp
  src/execution_monitor.cpp
  src/framework.cpp
  src/interaction_based.cpp
  src/logged_expectations.cpp
  src/plain_report_formatter.cpp
  src/progress_monitor.cpp
  src/results_collector.cpp
  src/results_reporter.cpp
  src/test_tools.cpp
  src/test_tree.cpp
  src/unit_test_log.cpp
  src/unit_test_main.cpp
  src/unit_test_monitor.cpp
  src/unit_test_parameters.cpp
  src/xml_log_formatter.cpp
  src/xml_report_formatter.cpp
  )

target_include_directories(boost_unit_test_framework PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_unit_test_framework PUBLIC
  boost::conversion
  boost::concept_check
  boost::detail
  boost::math::special_functions
  boost::algorithm
  boost::timer::header_only
  boost::function
  boost::type_traits
  boost::iterator
  boost::io
  boost::optional
  boost::smart_ptr
  )

add_library(boost::prg_exec_monitor ALIAS boost_prg_exec_monitor)
set_property(TARGET boost_prg_exec_monitor PROPERTY EXPORT_NAME prg_exec_monitor)
add_library(boost::test_exec_monitor ALIAS boost_test_exec_monitor)
set_property(TARGET boost_test_exec_monitor PROPERTY EXPORT_NAME test_exec_monitor)
add_library(boost::unit_test_framework ALIAS boost_unit_test_framework)
set_property(TARGET boost_unit_test_framework PROPERTY EXPORT_NAME unit_test_framework)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS
    boost_prg_exec_monitor
    boost_test_exec_monitor
    boost_unit_test_framework
  EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION lib/cmake/${PROJECT_NAME}
  )
