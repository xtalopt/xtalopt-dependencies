cmake_minimum_required(VERSION 3.0)
project(XtalOptDeps)

set(CMAKE_MODULE_PATH ${XtalOptDeps_SOURCE_DIR}/cmake)

include(ExternalProject)

include(External_eigen3)
include(External_libxml2)
include(External_openbabel)
