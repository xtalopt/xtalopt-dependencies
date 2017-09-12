cmake_minimum_required(VERSION 3.0)
project(XtalOptDeps)

set(CMAKE_MODULE_PATH ${XtalOptDeps_SOURCE_DIR}/cmake)

include(ExternalProject)

option(BUILD_STATIC_OBABEL
       "Whether or not to build the static OBabel executable used by XtalOpt"
       OFF)

option(BUILD_RDKIT
       "Whether or not to build RDKit to be used by XtalOpt"
       OFF)

if(BUILD_STATIC_OBABEL OR BUILD_RDKIT)
  include(External_eigen3)
endif()

if(BUILD_STATIC_OBABEL)
  include(External_libxml2)
  include(External_openbabel)
endif(BUILD_STATIC_OBABEL)

if(BUILD_RDKIT)
  include(External_boost)
  include(External_rdkit)
endif(BUILD_RDKIT)
