

#include <ros/ros.h>
#include <pcl/io/pcd_io.h>
#include <pcl/io/ply_io.h>
#include <pcl/point_cloud.h>
#include <pcl/console/parse.h>
#include <pcl/common/transforms.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <tf2/LinearMath/Quaternion.h>
#include <tf2/LinearMath/Matrix3x3.h>
#include <tf2_eigen/tf2_eigen.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_ros/transforms.h>
#include <Math.h>

void cloud_callback (const sensor_msgs::PointCloud2ConstPtr& cloud_msg)
{
    double roll,pitch, yaw;
    roll = -0.5*M_PI;
    pitch = -0.5*M_PI;
    yaw = 0;
    Eigen::AngleAxisd rollAngle(roll, Eigen::Vector3d::UnitX());
    Eigen::AngleAxisd pitchAngle(pitch, Eigen::Vector3d::UnitY());
    Eigen::AngleAxisd yawAngle(yaw, Eigen::Vector3d::UnitZ());
    Eigen::Quaternion<double> q = rollAngle * yawAngle * pitchAngle;
    Eigen::Matrix3d rotationMatrix = q.matrix();
    
    Eigen::Matrix3d R;
    // Find your Rotation Matrix
    Eigen::Vector3d T;
    // Find your translation Vector
    Eigen::Matrix4d Trans; // Your Transformation Matrix
    Trans.setIdentity();   // Set to Identity to make bottom row of Matrix 0,0,0,1
    Trans.block<3,3>(0,0) = R;
    Trans.block<3,1>(0,3) = T;

    sensor_msgs::PointCloud2 fixed;
    pcl_ros::transformPointCloud( cloud_msg, fixed, Trans );
}   

int main (int argc, char** argv) {
     ros::init (argc, argv, "cloud_sub");
     ros::NodeHandle nh;
     ros::Rate loop_rate(10);
     ros::Subscriber sub;
     sub = nh.subscribe ("input_cloud", 1, cloud_callback);
     ros::spin();
 }