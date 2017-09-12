# Written by Patrick Avery - 2017
# This module adds RDKit as a compilation target for the project
# The variables RDKit_INCLUDE_DIRS and RDKit_LIBRARIES will be
# set with the RDKit include directory and the RDKit libraries, respectively
# The include directory is automatically included.

set(_source "${CMAKE_CURRENT_SOURCE_DIR}/rdkit")
set(_build "${CMAKE_CURRENT_BINARY_DIR}/rdkit")

set(_deps "boost" "eigen3")

set(_cmake_cache_args
    -DRDK_BUILD_PYTHON_WRAPPERS:BOOL=OFF
    -DRDK_BUILD_SLN_SUPPORT:BOOL=OFF
    -DRDK_TEST_MMFF_COMPLIANCE:BOOL=OFF
    -DRDK_BUILD_CPP_TESTS:BOOL=OFF
    -DBoost_NO_BOOST_CMAKE:BOOL=TRUE
    -DBoost_NO_SYSTEM_PATHS:BOOL=TRUE
    -DBOOST_ROOT:PATH=${BOOST_ROOT}
    -DBoost_LIBRARY_DIRS:PATH=${BOOST_ROOT}/lib
    -DEIGEN3_INCLUDE_DIR:FILEPATH=${EIGEN3_INCLUDE_DIRS}
)

ExternalProject_Add(rdkit
  SOURCE_DIR ${_source}
  BINARY_DIR ${_build}
  CMAKE_CACHE_ARGS ${_cmake_cache_args}
  DEPENDS ${_deps}
)

include(RDKitLibraries)

# Set the include dirs, library dirs, and libraries
set(RDKit_INCLUDE_DIRS "${_source}/Code")
set(RDKit_LIBRARY_DIRS "${_source}/lib" )
set(RDKit_LIBRARIES "${RDKit_LIBRARIES}")
