# Distributed under the Boost Software License, Version 1.0.
# See http://www.boost.org/LICENSE_1_0.txt

cmake_minimum_required(VERSION 2.8.11)
project(BoostSerialization CXX)

if(MSVC)
  add_definitions(
    /Gy
    /wd4244 # converting 'std::streamsize' in 'size_t'
    /D_CRT_SECURE_NO_WARNINGS
    /D_SCL_SECURE_NO_WARNINGS
    )
endif()

add_library(boost_serialization
  src/basic_archive
  src/basic_iarchive
  src/basic_iserializer
  src/basic_oarchive
  src/basic_oserializer
  src/basic_pointer_iserializer
  src/basic_pointer_oserializer
  src/basic_serializer_map
  src/basic_text_iprimitive
  src/basic_text_oprimitive
  src/basic_xml_archive
  src/binary_iarchive
  src/binary_oarchive
  src/extended_type_info
  src/extended_type_info_typeid
  src/extended_type_info_no_rtti
  src/polymorphic_iarchive
  src/polymorphic_oarchive
  src/stl_port
  src/text_iarchive
  src/text_oarchive
  src/void_cast
  src/archive_exception
  src/xml_grammar
  src/xml_iarchive
  src/xml_oarchive
  src/xml_archive_exception
  src/shared_ptr_helper
  )

target_include_directories(boost_serialization PUBLIC
  "$<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>"
  )

target_link_libraries(boost_serialization PUBLIC
  boost::array
  boost::config
  boost::detail
  boost::spirit
  boost::function
  boost::preprocessor
  boost::type_traits
  boost::io
  boost::iterator
  boost::utility
  boost::static_assert
  boost::smart_ptr
  )

add_library(boost_wserialization
  src/basic_text_wiprimitive
  src/basic_text_woprimitive
  src/text_wiarchive
  src/text_woarchive
  src/utf8_codecvt_facet
  src/xml_wgrammar
  src/xml_wiarchive
  src/xml_woarchive
  src/codecvt_null
  )

target_link_libraries(boost_wserialization PUBLIC
  boost_serialization
  )

add_library(boost::serialization ALIAS boost_serialization)
set_property(TARGET boost_serialization PROPERTY EXPORT_NAME serialization)
add_library(boost::wserialization ALIAS boost_wserialization)
set_property(TARGET boost_wserialization PROPERTY EXPORT_NAME wserialization)

install(DIRECTORY include/ DESTINATION include)

install(TARGETS boost_serialization boost_wserialization
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
