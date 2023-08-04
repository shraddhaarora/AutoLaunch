cmake_minimum_required(VERSION 3.0)

Project(Test VERSION 1.0.0)

enable_language(OBJCXX)

set(MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION})
set(CMAKE_C_FLAGS "-x objective-c")

add_executable(Executable
MACOSX_BUNDLE
 main.m
AppDelegate.m
)
set_target_properties(
Executable
PROPERTIES
MACOSX_BUNDLE_INFO_PLIST
${CMAKE_CURRENT_LIST_DIR}/Info.plist
)

target_link_libraries(Executable "-framework Cocoa")
target_link_libraries(Executable "-framework Foundation")
target_link_libraries(Executable "-framework ServiceManagement")
target_link_libraries(Executable "-framework AppKit")
