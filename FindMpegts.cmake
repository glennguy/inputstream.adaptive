#.rst:
# FindMpegts
# --------
# Finds the Mpegts library
#
# This will define the following variables::
#
# MPEGTS_FOUND - system has Bento4
# MPEGTS_INCLUDE_DIRS - the Bento4 include directory
# MPEGTS_LIBRARIES - the Bento4 libraries

if(PKG_CONFIG_FOUND)
  pkg_check_modules(PC_MPEGTS REQUIRED)
endif()

find_path(MPEGTS_INCLUDE_DIR NAMES mpegts/elementaryStream.h PATHS ${PC_MPEGTS_INCLUDEDIR})

find_library(MPEGTS_LIBRARY NAMES mpegts PATHS ${PC_MPEGTS_LIBDIR})
                                   
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Mpegts REQUIRED_VARS MPEGTS_LIBRARY MPEGTS_INCLUDE_DIR)

if(MPEGTS_FOUND)
  set(MPEGTS_LIBRARIES ${MPEGTS_LIBRARY})
  set(MPEGTS_INCLUDE_DIRS ${MPEGTS_INCLUDE_DIR})
endif()

mark_as_advanced(MPEGTS_INCLUDE_DIR MPEGTS_LIBRARY)
