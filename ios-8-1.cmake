# Copyright (c) 2014, Ruslan Baratov
# All rights reserved.

if(DEFINED POLLY_IOS_8_1_CMAKE_)
  return()
else()
  set(POLLY_IOS_8_1_CMAKE_ 1)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_clear_environment_variables.cmake")

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_init.cmake")

polly_init(
    "iOS 8.1 Universal (iphoneos + iphonesimulator) / c++11 support"
    "Xcode"
)

include("${CMAKE_CURRENT_LIST_DIR}/utilities/polly_common.cmake")

include(polly_fatal_error)

# There is no way to change compiler for Xcode generator so there is no sense
# to set CMAKE_C_COMPILER/CMAKE_CXX_COMPILER variables here. If you know
# how to change default compiler that Xcode use please let me know :)

# Fix try_compile
set(MACOSX_BUNDLE_GUI_IDENTIFIER com.example)
set(CMAKE_MACOSX_BUNDLE YES)
set(CMAKE_XCODE_ATTRIBUTE_CODE_SIGN_IDENTITY "iPhone Developer")

set(IPHONEOS_ARCHS armv7;armv7s;arm64)
set(IPHONESIMULATOR_ARCHS i386;x86_64)
set(IOS_SDK_VERSION 8.1)

include("${CMAKE_CURRENT_LIST_DIR}/os/iphone.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/flags/cxx11.cmake")
