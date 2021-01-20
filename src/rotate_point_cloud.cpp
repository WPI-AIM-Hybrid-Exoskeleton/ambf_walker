
#include "ros/ros.h"
#include <sensor_msgs/PointCloud2.h>

#include "pcl/point_cloud.h"
#include <pcl_ros/transforms.h>

#include <ros/ros.h>
#include <ros/console.h>
// PCL specific includes
#include <tf2_ros/transform_broadcaster.h>
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/filters/extract_indices.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl_ros/transforms.h>


ros::Publisher pub;
tf::StampedTransform transform;

void cloud_callback (const sensor_msgs::PointCloud2ConstPtr& input)
{
    // Create a container for the data.
    pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_transformed(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr temp_cloud(new pcl::PointCloud<pcl::PointXYZ>);

    pcl::PCLPointCloud2 pcl_pc2;
    pcl_conversions::toPCL(*input, pcl_pc2);
    pcl::fromPCLPointCloud2(pcl_pc2,*temp_cloud);
    pcl_ros::transformPointCloud(*temp_cloud, *cloud_transformed, transform);
    sensor_msgs::PointCloud2 cloud_publish;
    pcl::toROSMsg(*cloud_transformed,cloud_publish);
    cloud_publish.header = input->header;
    cloud_publish.header.frame_id = "/AMBF_camera";
    pub.publish(cloud_publish);

}

int main (int argc, char** argv)
{

    // Initialize ROS
    ROS_INFO("Node started");

    ros::init (argc, argv, "point_cloud_transform");
    ros::NodeHandle nh;

    // Create a ROS subscriber for the input point cloud
    ros::Subscriber sub = nh.subscribe ("/ambf/env/cameras/depth_camera/DepthData", 1, cloud_callback);

    // Create a ROS publisher for the output point cloud
    pub = nh.advertise<sensor_msgs::PointCloud2> ("/transformed_cloud", 1);

    tf::TransformListener listener;
    static tf2_ros::TransformBroadcaster br;

    double roll,pitch, yaw;
    roll = -0.5*M_PI;
    pitch = -0.5*M_PI;
    yaw = 0;

    while (ros::ok() )
    {
        transform.setOrigin( tf::Vector3(0.0, 0.0, 0.0) );
        transform.setRotation( tf::Quaternion(roll, pitch, yaw) );
        geometry_msgs::TransformStamped transformStamped;
        transformStamped.header.stamp = ros::Time::now();
        transformStamped.header.frame_id = "/depth_camera";
        transformStamped.child_frame_id = "/AMBF_camera";
        transformStamped.transform.translation.x = 0.0;
        transformStamped.transform.translation.y = 0.0;
        transformStamped.transform.translation.z = 0.0;
        tf2::Quaternion q;
        q.setRPY(roll, pitch, yaw);
        transformStamped.transform.rotation.x = q.x();
        transformStamped.transform.rotation.y = q.y();
        transformStamped.transform.rotation.z = q.z();
        transformStamped.transform.rotation.w = q.w();
        br.sendTransform(transformStamped);

        ros::spinOnce();
    }



    return 0;

}








// void cloud_callback (const sensor_msgs::PointCloud2ConstPtr& cloud_msg)
// {

//     double roll,pitch, yaw;
//     roll = -0.5*M_PI;
//     pitch = -0.5*M_PI;
//     yaw = 0;

//     while (ros::ok() )
//     {
//         transform.setOrigin( tf::Vector3(0.0, 0.0, 0.0) );
//         transform.setRotation( tf::Quaternion(0, 0, 0) );
//         br.sendTransform(tf::StampedTransform(transform, ros::Time::now(), "depth_camera", "AMBF_camera"));
        
//     }

//     Eigen::AngleAxisd rollAngle(roll, Eigen::Vector3d::UnitX());
//     Eigen::AngleAxisd pitchAngle(pitch, Eigen::Vector3d::UnitY());
//     Eigen::AngleAxisd yawAngle(yaw, Eigen::Vector3d::UnitZ());
//     Eigen::Quaternion<double> q = rollAngle * yawAngle * pitchAngle;
//     Eigen::Matrix3d rotationMatrix = q.matrix();
    
//     Eigen::Matrix3d R;
//     // Find your Rotation Matrix
//     Eigen::Vector3d T;
//     // Find your translation Vector
//     Eigen::Matrix4f Trans; // Your Transformation Matrix
//     // Trans.setIdentity();   // Set to Identity to make bottom row of Matrix 0,0,0,1
//     // Trans.block<3,3>(0,0) = R;
//     // Trans.block<3,1>(0,3) = T;

//     sensor_msgs::PointCloud2 fixed, temp;

//     pcl_ros::transformPointCloud(  Trans, temp, fixed );
// }   

// int main (int argc, char** argv) 
// {
//      ros::init (argc, argv, "cloud_sub");
//      ros::NodeHandle nh;
//      ros::Rate loop_rate(10);
//      ros::Subscriber sub;
//     //  sub = nh.subscribe ("input_cloud", 1, cloud_callback);
//      ros::spin();
//  }