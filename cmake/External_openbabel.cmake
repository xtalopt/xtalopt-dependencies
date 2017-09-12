# Written by Patrick Avery - 2017

# This builds a static open babel executable. It depends on a static libxml2.

set(_source "${CMAKE_CURRENT_SOURCE_DIR}/openbabel")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/openbabel")

unset(_deps)
set(_deps
    "eigen3"
    "libxml2")

set(_cmake_cache_args
    "-DBUILD_SHARED:BOOL=OFF"
    "-DWITH_STATIC_LIBXML:BOOL=ON"
    "-DLIBXML2_INCLUDE_DIR:FILEPATH=${LIBXML2_INCLUDE_DIRS}"
    "-DLIBXML2_LIBRARIES:FILEPATH=${LIBXML2_LIBRARIES}"
    "-DCMAKE_BUILD_TYPE:STRING=Release"
    "-DEIGEN3_INCLUDE_DIR:FILEPATH=${EIGEN3_INCLUDE_DIRS}"
)

ExternalProject_Add(openbabel
  SOURCE_DIR ${_source}
  BINARY_DIR ${_build}
  CMAKE_CACHE_ARGS ${_cmake_cache_args}
  DEPENDS ${_deps}
)
