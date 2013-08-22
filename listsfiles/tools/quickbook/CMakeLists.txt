# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(Quickbook CXX)

if(MSVC)
  add_definitions(-D_SCL_SECURE_NO_WARNINGS -D_CRT_SECURE_NO_WARNINGS
    /wd4244 /wd4267 /wd4355 /wd4511 /wd4512 /wd4701 /wd4702 /wd4800)
endif()

add_executable(quickbook
  src/quickbook.cpp
  src/actions.cpp
  src/doc_info_actions.cpp
  src/state.cpp
  src/dependency_tracker.cpp
  src/utils.cpp
  src/files.cpp
  src/input_path.cpp
  src/values.cpp
  src/id_manager.cpp
  src/id_generation.cpp
  src/id_xml.cpp
  src/post_process.cpp
  src/collector.cpp
  src/template_stack.cpp
  src/code_snippet.cpp
  src/markups.cpp
  src/syntax_highlight.cpp
  src/grammar.cpp
  src/main_grammar.cpp
  src/block_element_grammar.cpp
  src/phrase_element_grammar.cpp
  src/doc_info_grammar.cpp
  )

target_include_directories(quickbook PRIVATE
  $<TARGET_PROPERTY:boost::iostreams,INTERFACE_INCLUDE_DIRECTORIES>
  )

target_link_libraries(quickbook PRIVATE
  boost::program_options
  boost::filesystem
  boost::spirit
  boost::math
  )

install(TARGETS quickbook EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
