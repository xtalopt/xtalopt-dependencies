cmake_minimum_required(VERSION 3.0)
project(XtalOptDeps)

set(CMAKE_MODULE_PATH ${XtalOptDeps_SOURCE_DIR}/cmake)

include(ExternalProject)

option(BUILD_STATIC_OBABEL
       "Whether or not to build the static OBabel executable used by XtalOpt"
       ON)

if(BUILD_STATIC_OBABEL)
  include(External_eigen3)
  include(External_libxml2)
  include(External_openbabel)
endif(BUILD_STATIC_OBABEL)
