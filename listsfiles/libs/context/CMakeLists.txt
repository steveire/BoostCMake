# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostContext ASM CXX)

add_subdirectory(test)

set(abi
  aapcs
  eabi
  ms
  n32
  n64
  o32
  o64
  sysv
  )

set(binary_format
  elf
  mach-o
  pe
  )

if(WIN32)
  set(default_abi ms)
elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "arm")
  set(default_abi aapcs)
elseif("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "mips")
  set(default_abi o32)
else()
  set(default_abi sysv)
endif()
  
if(APPLE)
  set(default_binary_format mach-o)
elseif(WIN32)
  set(default_binary_format pe)
else()
  set(default_binary_format elf)
endif()

set(BOOST_CONTEXT_ABI ${default_abi}
  CACHE STRING "ABI for Boost.Context (${abi})"
  )
set_property(CACHE BOOST_CONTEXT_ABI
  PROPERTY STRINGS "${abi}"
  )

set(BOOST_CONTEXT_BINARY_FORMAT ${default_binary_format}
  CACHE STRING "Binary format for Boost.Context (${binary_format})"
  )
set_property(CACHE BOOST_CONTEXT_BINARY_FORMAT
  PROPERTY STRINGS "${binary_format}"
  )

# TODO:
set(sources
  src/asm/make_x86_64_sysv_elf_gas.S
  src/asm/jump_x86_64_sysv_elf_gas.S
  )

add_library(boost_context
  ${sources}
  )

target_include_directories(boost_context INTERFACE
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  "$<INSTALL_INTERFACE:${CMAKE_INSTALL_PREFIX}/include>"
  )

add_library(boost::context ALIAS boost_context)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_context EXPORT ${PROJECT_NAME}Targets
  RUNTIME DESTINATION bin
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  )

install(EXPORT ${PROJECT_NAME}Targets
  FILE ${PROJECT_NAME}Targets.cmake
  DESTINATION CMake
  )
