# Written by Patrick Avery - 2017

# This will build static libxml2 libraries eventually to be
# used for Open Babel

if(UNIX)
  set(config_cmd "./configure")
  set(config_args
      "--without-iconv"
      "--without-python"
      "--without-http"
      "--without-ftp"
      "--without-zlib"
      "--without-lzma"
      "--prefix=${CMAKE_BINARY_DIR}/libxml2-install"
  )
  set(build_cmd "make" "-j2")
  set(install_cmd "make" "install")
else(UNIX)
  set(install_dir "${CMAKE_BINARY_DIR}/libxml2-install")
  STRING(REGEX REPLACE "/" "\\\\" install_dir ${install_dir})
  message("install_dir is ${install_dir}")
  set(config_cmd "cd" "win32" "&&" "cscript")
  set(config_args
      "configure.js"
      "compiler=msvc"
      "prefix=${install_dir}"
      "iconv=no"
      "zlib=no"
      "static=yes"
      "ftp=no"
      "http=no"
      "cruntime=/MT"
  )
  set(build_cmd "cd" "win32" "&&" "nmake" "Makefile.msvc")
  set(install_cmd "cd" "win32" "&&" "nmake" "Makefile.msvc" "install")
endif(UNIX)

# If we have apple, we should export a few C and CXX flags first
if(APPLE)
  set(build_cmd
      export CFLAGS=-mmacosx-version-min=10.9
      &&
      export CPPFLAGS=-mmacosx-version-min=10.9
      &&
      ${build_cmd}
  )
endif(APPLE)

set(libxml2_cmds
  CONFIGURE_COMMAND ${config_cmd} ${config_args}
  BUILD_COMMAND ${build_cmd}
  INSTALL_COMMAND ${install_cmd}
)

set(_source "${CMAKE_BINARY_DIR}/libxml2")

unset(_deps)

set(_v 2.9.5)
set(libxml2_version ${_v})
set(libxml2_url "ftp://xmlsoft.org/libxml2/libxml2-${_v}.tar.gz")
set(libxml2_md5 "5ce0da9bdaa267b40c4ca36d35363b8b")

ExternalProject_Add(libxml2
  DOWNLOAD_DIR "${CMAKE_CURRENT_BINARY_DIR}/downloads"
  URL ${libxml2_url}
  URL_MD5 ${libxml2_md5}
  SOURCE_DIR "${_source}"
  ${libxml2_cmds}
  BUILD_IN_SOURCE 1
  DEPENDS ${_deps}
)

# Set the include dirs, library dirs, and libraries in the parent scope
set(LIBXML2_ROOT "${CMAKE_BINARY_DIR}/libxml2-install")
set(LIBXML2_INCLUDE_DIRS "${LIBXML2_ROOT}/include")

if(UNIX)
  set(LIBXML2_LIBRARIES "${LIBXML2_ROOT}/lib/libxml2.a")
else(UNIX)
  set(LIBXML2_LIBRARIES "${LIBXML2_ROOT}/lib/libxml2_a.lib")
endif(UNIX)
