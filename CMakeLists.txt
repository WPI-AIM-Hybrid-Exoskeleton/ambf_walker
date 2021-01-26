cmake_minimum_required(VERSION 2.8.3)
project(ambf_walker)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  pcl_conversions 
  pcl_ros
  std_msgs
  tf
  message_generation
  rbdl_server
  controller_modules
  trajectory_msgs
)

find_package( PCL REQUIRED )

## System dependencies are found with CMake's conventions
# find_package(Boost REQUIRED COMPONENTS system)


## Uncomment this if the package has a setup.py. This macro ensures
## modules and global scripts declared therein get installed
## See http://ros.org/doc/api/catkin/html/user_guide/setup_dot_py.html
catkin_python_setup()


## Generate messages in the 'msg' folder
 add_message_files(
 FILES
 DesiredJoints.msg
 )

add_service_files(
  FILES
  DesiredJointsCmd.srv
)

## Generate added messages and services with any dependencies listed here
generate_messages(
   DEPENDENCIES
   std_msgs
 )

 catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS  roscpp rospy std_msgs message_runtime
)

FIND_PACKAGE (Eigen3 3.0.0 REQUIRED)
include_directories(${Eigen3_INCLUDE_DIRS})

include_directories( include ${catkin_INCLUDE_DIRS} ${GTEST_INCLUDE_DIRS} ${Eigen_INCLUDE_DIRS} ${EIGEN3_INCLUDE_DIR})



include_directories(
  ${catkin_INCLUDE_DIRS}
  ${PCL_INCLUDE_DIRS}
  )

link_directories(${PCL_LIBRARY_DIRS})
add_definitions(${PCL_DEFINITIONS})



set(SRC_FILES
   src/DynController.cpp
   
   )

set (HDR_FILES
   include/${PROJECT_NAME}/DynController.h
   )



add_library(${PROJECT_NAME} ${SRC_FILES} ${HRD_FILES} )
add_dependencies(${PROJECT_NAME}  ${catkin_EXPORTED_TARGETS})
target_link_libraries(${PROJECT_NAME} ${Boost_LIBRARIES} ${Eigen_LIBRARIES} ${catkin_LIBRARIES})



add_executable(rotate_point_cloud src/rotate_point_cloud.cpp)
target_link_libraries(rotate_point_cloud  ${PCL_LIBRARIES} ${catkin_LIBRARIES})
# add_dependencies(rotate_point_cloud beginner_tutorials_generate_messages_cpp)


add_executable (dynamic_server src/dynamic_server.cpp)
add_dependencies (dynamic_server ${catkin_EXPORTED_TARGETS})
target_link_libraries(dynamic_server ${RBDL_SERVER_LIBRARIES} ${Boost_LIBRARIES} ${Eigen_LIBRARIES} ${CONTROLLER_MODULES_LIBRARIES}  ${catkin_LIBRARIES} ${Eigen_LIBRARIES} pthread)


add_executable (exo_controller_server src/exo_controller_server.cpp)
add_dependencies (exo_controller_server ${catkin_EXPORTED_TARGETS})
target_link_libraries(exo_controller_server ${PROJECT_NAME}  ${RBDL_SERVER_LIBRARIES} ${Boost_LIBRARIES} ${Eigen_LIBRARIES} ${CONTROLLER_MODULES_LIBRARIES}  ${catkin_LIBRARIES} ${Eigen_LIBRARIES} pthread)



