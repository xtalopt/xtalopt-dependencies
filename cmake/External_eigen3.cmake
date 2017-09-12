# Written by Patrick Avery - 2017

# This will simply download eigen3

set(_source "${CMAKE_BINARY_DIR}/eigen3")

unset(_deps)

set(_v 3.3.4)
set(eigen3_version ${_v})
set(eigen3_url "http://bitbucket.org/eigen/eigen/get/${_v}.tar.gz")
set(eigen3_md5 "1a47e78efe365a97de0c022d127607c3")

ExternalProject_Add(eigen3
  DOWNLOAD_DIR "${CMAKE_CURRENT_BINARY_DIR}/downloads"
  URL ${eigen3_url}
  URL_MD5 ${eigen3_md5}
  SOURCE_DIR "${_source}"
  DEPENDS ${_deps}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  INSTALL_COMMAND ""
)

# Set the include dirs and library dirs
set(EIGEN3_ROOT "${CMAKE_BINARY_DIR}/eigen3")
set(EIGEN3_INCLUDE_DIRS "${EIGEN3_ROOT}")
