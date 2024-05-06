#[=======================================================================[.rst
FindLibDataChannel
----------

FindModule for LibDataChannel library

Imported Targets
^^^^^^^^^^^^^^^^

This module defines the :prop_tgt:`IMPORTED` target ``LibDataChannel::LibDataChannel``.

Result Variables
^^^^^^^^^^^^^^^^

This module sets the following variables:

``LibDataChannel_FOUND``
  True, if the library was found.

Cache variables
^^^^^^^^^^^^^^^

The following cache variables may also be set:

``LibDataChannel_INCLUDE_DIR``
  Directory containing ``rtc/rtc.hpp``.

#]=======================================================================]

include(FindPackageHandleStandardArgs)

find_path(
  LibDataChannel_INCLUDE_DIR
  NAMES rtc/rtp.hpp
  PATHS ${PROJECT_SOURCE_DIR}/ext/libdatachannel/include)

find_library(
  LibDataChannel_LIBRARY
  NAMES libdatachannel.so
  PATHS ${PROJECT_SOURCE_DIR}/ext/libdatachannel/build)

include(SelectLibraryConfigurations)
select_library_configurations(libdatachannel)

find_package_handle_standard_args(
  LibDataChannel
  REQUIRED_VARS LibDataChannel_LIBRARY LibDataChannel_INCLUDE_DIR)
mark_as_advanced(LibDataChannel_LIBRARY LibDataChannel_INCLUDE_DIR)

if(LibDataChannel_FOUND)
  if(NOT TARGET LibDataChannel::LibDataChannel)
    if(IS_ABSOLUTE "${LibDataChannel_LIBRARY}")
      add_library(LibDataChannel::LibDataChannel UNKNOWN IMPORTED)
      set_property(TARGET LibDataChannel::LibDataChannel PROPERTY IMPORTED_LOCATION "${LibDataChannel_LIBRARY}")
    else()
      add_library(LibDataChannel::LibDataChannel INTERFACE IMPORTED)
      set_property(TARGET LibDataChannel::LibDataChannel PROPERTY IMPORTED_LIBNAME "${LibDataChannel_LIBRARY}")
    endif()
    set_target_properties(LibDataChannel::LibDataChannel PROPERTIES INTERFACE_INCLUDE_DIRECTORIES "${LibDataChannel_INCLUDE_DIR}")
  endif()
endif()
