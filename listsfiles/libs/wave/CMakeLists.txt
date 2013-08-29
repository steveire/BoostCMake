# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostWave CXX)

if(MSVC)
  add_definitions(
    -D_CRT_SECURE_NO_WARNINGS
    -D_SCL_SECURE_NO_WARNINGS
    )
endif()

add_library(boost_wave
  src/instantiate_cpp_exprgrammar.cpp
  src/instantiate_cpp_grammar.cpp
  src/instantiate_cpp_literalgrs.cpp
  src/instantiate_defined_grammar.cpp
  src/instantiate_predef_macros.cpp
  src/instantiate_re2c_lexer.cpp
  src/instantiate_re2c_lexer_str.cpp
  src/token_ids.cpp
  src/wave_config_constant.cpp
  src/cpplexer/re2clex/aq.cpp
  src/cpplexer/re2clex/cpp_re.cpp
  )

target_include_directories(boost_wave PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>
  )

target_link_libraries(boost_wave
  boost::thread
  boost::spirit
  boost::filesystem
  boost::multi_index
  boost::pool
  )

add_library(boost::wave ALIAS boost_wave)
set_property(TARGET boost_wave PROPERTY EXPORT_NAME wave)

add_executable(wave
  tool/cpp.cpp
  )

target_link_libraries(wave
  boost::wave
  boost::timer
  boost::any
  boost::serialization
  boost::foreach
  boost::program_options
  )

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_wave wave EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  NAMESPACE boost::
  DESTINATION CMake
  )
