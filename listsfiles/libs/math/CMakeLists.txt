# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostMath CXX)

#include(RypplPrecompileHeader)

set(C99_SOURCES
  acosh
  asinh
  atanh
  cbrt
  copysign
  erfc
  erf
  expm1
  fmax
  fmin
  fpclassify
  hypot
  lgamma
  llround
  log1p
  lround
  nextafter
  nexttoward
  round
  tgamma
  trunc
  )

set(TR1_SOURCES
  assoc_laguerre
  assoc_legendre
  beta
  comp_ellint_1
  comp_ellint_2
  comp_ellint_3
  cyl_bessel_i
  cyl_bessel_j
  cyl_bessel_k
  cyl_neumann
  ellint_1
  ellint_2
  ellint_3
  expint
  hermite
  laguerre
  legendre
  riemann_zeta
  sph_bessel
  sph_legendre
  sph_neumann
  )

include_directories(src/tr1)

add_library(boost_math_special_functions INTERFACE)
add_library(boost::math::special_functions ALIAS boost_math_special_functions)
set_property(TARGET boost_math_special_functions PROPERTY EXPORT_NAME math::special_functions)
target_include_directories(boost_math_special_functions INTERFACE
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  )

function(add_math_library name suffix)
  set(sources)
  foreach(src ${ARGN})
    list(APPEND sources "src/tr1/${src}${suffix}.cpp")
  endforeach(src)
# ryppl_add_pch(${name} sources
#   <boost/math/special_functions.hpp>
#   )
  add_library(boost_math_${name}
    ${sources}
    )
# ryppl_add_pch_to_target(boost_math_${name}
#   ${PCH_HEADER}
#   )
  target_link_libraries(boost_math_${name} PUBLIC
    boost::conversion
    boost::concept_check
    boost::config
    boost::detail
    boost::math::special_functions
    boost::format
    boost::fusion
    boost::type_traits
    boost::integer
    boost::static_assert
    boost::tr1
    )
  add_library(boost::math::${name} ALIAS boost_math_${name})
set_property(TARGET boost_math_${name} PROPERTY EXPORT_NAME math_${name})
endfunction()

add_math_library(tr1  ""  ${TR1_SOURCES})
add_math_library(tr1f "f" ${TR1_SOURCES})
add_math_library(tr1l "l" ${TR1_SOURCES})
add_math_library(c99  ""  ${C99_SOURCES})
add_math_library(c99f "f" ${C99_SOURCES})
add_math_library(c99l "l" ${C99_SOURCES})

install(DIRECTORY include/ DESTINATION include)

install(TARGETS
    boost_math_special_functions
    boost_math_tr1
    boost_math_tr1f
    boost_math_tr1l
    boost_math_c99
    boost_math_c99f
    boost_math_c99l
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

write_config_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
  Conversion
  ConceptCheck
  Config
  Detail
  Math
  Format
  Fusion
  TypeTraits
  Integer
  StaticAssert
  TR1
  )
write_basic_package_version_file("${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
  VERSION ${BOOST_VERSION}
  COMPATIBILITY AnyNewerVersion
  )

install(FILES
    "${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Config.cmake"
    "${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}ConfigVersion.cmake"
  DESTINATION lib/cmake/${PROJECT_NAME}
)

export(TARGETS boost_math_special_functions
  NAMESPACE boost::
  FILE ${CMAKE_BINARY_DIR}/lib/cmake/${PROJECT_NAME}/${PROJECT_NAME}Targets.cmake)
