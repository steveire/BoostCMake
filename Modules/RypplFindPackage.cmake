# Convenient wrappers for find_package.
#
#    ryppl_find_package(...)
#    ryppl_find_and_use_package(...)
#
# Both functions take the same arguments as find_package. Please refer to the
# documentation of find_package for details.
#
# ryppl_find_package calls find_package, and additionally remembers the
# arguments for package dependency tracking.
#
# ryppl_find_and_use_package calls ryppl_find_package and adds the
# <Package>_DEFINITIONS to the current directories definitions and the
# <Package>_INCLUDE_DIRS to the current directories include directories.

#=============================================================================
# Copyright (C) 2012 Dave Abrahams <dave@boostpro.com>
#
# Distributed under the Boost Software License, Version 1.0.
# See accompanying file LICENSE_1_0.txt or copy at
#   http://www.boost.org/LICENSE_1_0.txt
#=============================================================================

macro(ryppl_find_package)
  if(RYPPL_INITIAL_PASS)
    find_package(${ARGV} QUIET MODULE)
  else()
    find_package(${ARGV} REQUIRED)
  endif()
endmacro()

macro(ryppl_find_and_use_package)
  ryppl_find_package(${ARGV})
  add_definitions(${${ARGV0}_DEFINITIONS})
  include_directories(${${ARGV0}_INCLUDE_DIRS})
endmacro()
