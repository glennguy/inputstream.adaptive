cmake_minimum_required(VERSION 3.5)
project(mpegts)

if(TSDEMUX_DEBUG)
  add_definitions(-DTSDEMUX_DEBUG)
endif(TSDEMUX_DEBUG)

set(SOURCE_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/src)

add_library(mpegts STATIC
  ${SOURCE_ROOT}/elementaryStream.cpp
  ${SOURCE_ROOT}/bitstream.cpp
  ${SOURCE_ROOT}/ES_AC3.cpp
  ${SOURCE_ROOT}/ES_MPEGAudio.cpp
  ${SOURCE_ROOT}/ES_Subtitle.cpp
  ${SOURCE_ROOT}/ES_AAC.cpp
  ${SOURCE_ROOT}/ES_h264.cpp
  ${SOURCE_ROOT}/ES_MPEGVideo.cpp
  ${SOURCE_ROOT}/ES_Teletext.cpp
  ${SOURCE_ROOT}/ES_hevc.cpp
  ${SOURCE_ROOT}/debug.cpp
  ${SOURCE_ROOT}/tsDemuxer.cpp)

set_target_properties(mpegts PROPERTIES POSITION_INDEPENDENT_CODE True)

file(GLOB MPEGTS_HEADERS ${SOURCE_ROOT}/*.h)

install(TARGETS mpegts DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)

install(
    FILES ${MPEGTS_HEADERS}
    DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mpegts"
)

