#include "ros/ros.h"
#include "Eigen/Core"
#include "std_msgs/Float32MultiArray.h"
#include "std_msgs/Float32.h"
#include "controller_modules/ControllerManager.h"
#include "controller_modules/PDController.h"
#include "controller_modules/JointControl.h"
#include "rbdl_server/RBDLServer.h"
#include "rbdl_server/RBDLModel.h"
#include "rbdl_server/RBDLBodyNames.h"
#include "rbdl_server/RBDLInverseDynamics.h"
#include "rbdl_server/RBDLModelAlignment.h"
#include "boost/shared_ptr.hpp"
#include "ambf_client/ambf_client.h"
#include "ambf_walker/DesiredJoints.h"

rigidBodyPtr exo_handler;
bool enabled_control;
std::map<int, float> tau;
std::map<std::string, int> tau_map;
std::map<std::string, int> joint_map_selected;
std::vector<double> q, qd;
std::vector<double> q_desired, qd_desired,qdd_desired;
std::map<std::string, int> jointMap;
ros::ServiceClient client_model; 
ros::ServiceClient client_ID; 
ros::ServiceClient client_controller;
std::vector<std::string> selected_joints;
vector<int> joint_indexs;
vector<string> joint_names;
ros::Publisher chatter_pub, dt_pub;


std::vector<double> get_q()
{
    
    std::vector<float> q_ = exo_handler->get_all_joint_pos();
    std::vector<double> joints = {0,0,0,0,0,0,0};
    int count = 0;
    
    for(auto&& joint : selected_joints) 
    {
        int index = tau_map[joint];
        joints[count] = (double)q_[index];
        count++;
    }

    return joints;

}

std::vector<double> get_qd()
{
    std::vector<float> qd_ = exo_handler->get_all_joint_vel();
    std::vector<double> joints = {0,0,0,0,0,0,0};

    int count = 0;
    for(auto&& joint : selected_joints) 
    {
        int index = tau_map[joint];
        joints[count] = (double)qd_[index];
        count++;
    }

    return joints;

}


void ambf_to_rbdl(const vector<double> joints, vector<double> &joints_aligned)
{

    //map<string, int>::iterator it;
    joints_aligned = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0};

    int count = 0;
    for(auto&& item : selected_joints) 
    {
    
        int index =  0;
        if(  selected_joints.size() > joint_names.size() )
        {
            index =  joint_map_selected[item];
        }
        else
        {
            index =  jointMap[item]-1;
        }
        joints_aligned[index] = joints[count];
        count++;
    }
}


void rbdl_to_ambf(const vector<double> joints, vector<double> &joints_aligned)
{

    //map<string, int>::iterator it;
    joints_aligned = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0};
    

    int count = 0;
    for(auto&& item : joint_names) 
    {
        int index = 0; 
        if(  selected_joints.size() > joint_names.size() )
        {
            index =  joint_map_selected[item];
        }
        else
        {
            index =  jointMap[item]-1;
        }
        joints_aligned[count] = joints[index];
        count++;
    }

}



void update_tau()
{
    double start =ros::Time::now().toSec();
    std::cout<<"callingback\n";
    controller_modules::JointControl joint_msg;
    rbdl_server::RBDLInverseDynamics dyn_msg;


    joint_msg.request.controller_name = "Dyn"; // joints.controller;
    std::vector<double> q_aligned, qd_aligned, q_aligned_desired, qd_aligned_desired,qdd_aligned_desired;
    // q = get_q();
    // qd = get_qd();
    ambf_to_rbdl(qd, qd_aligned);
    ambf_to_rbdl(q, q_aligned);
    ambf_to_rbdl(qdd_desired, qdd_aligned_desired);
    ambf_to_rbdl(qd_desired, qd_aligned_desired);
    ambf_to_rbdl(q_desired, q_aligned_desired);

    joint_msg.request.actual.velocities = qd_aligned;
    joint_msg.request.actual.positions = q_aligned;
    joint_msg.request.desired.positions = q_aligned_desired;
    joint_msg.request.desired.velocities = qd_aligned_desired;
    joint_msg.request.desired.accelerations = qdd_aligned_desired;

    if (client_controller.call(joint_msg))
    {
        std::vector<double> effort = joint_msg.response.control_output.effort;
        std::vector<double> tau_aligned;
        rbdl_to_ambf(effort, tau_aligned); 
        int count = 0;
        for(auto&& item : selected_joints) 
        {   
            tau[tau_map[item]] = tau_aligned[count]; 
            count++;
        }

    }
    else
    {
        ROS_INFO("Failed to call service controller");
       
    }
   
}


void tau_callback(const ambf_walker::DesiredJoints joints)
{
    qd_desired = joints.qd;
    q_desired = joints.q;
    qdd_desired = joints.qdd;
    enabled_control = true;
}


void main_loop()
{
    std_msgs::Float32MultiArray msg;
    std_msgs::Float32 dt_msg;
    ros::Rate loop_rate(500);    
    double last_time = ros::Time::now().toSec();
    while(ros::ok())
    { 
      q = get_q();
      qd = get_qd();
      msg.data = std::vector<float>(q_desired.begin(), q_desired.end());
      chatter_pub.publish(msg);
      double current_time = ros::Time::now().toSec();
      dt_msg.data = current_time - last_time;
      last_time = current_time;
      dt_pub.publish(dt_msg);
      if( enabled_control)
      {
        update_tau();
        exo_handler->set_multiple_joint_effort(tau);
      }
      loop_rate.sleep();
      ros::spinOnce();
    }

}


int main(int argc, char **argv)
{
    Client client;
    client.connect();
    ros::NodeHandle n;
    usleep(10000);
    exo_handler = client.getRigidBody("ExoHip", true);
    usleep(100000);
    ros::Duration(5.0).sleep();  // Sleep for one second
    //        exo_handler->set_rpy(0.25,0,0);
    //    exo_handler->set_pos(0.0,0,2.0);
      // Sleep for one second
    const std::string actuator_config_file = "/home/nathaniel/catkin_ws/src/ambf_walker/ambf_models/lumped/lumped.yaml";
    tau_map["ExoHipCrutches"] = 0;
    tau_map["ExoLeftKnee"] = 1;
    tau_map["ExoLeftAnkle"] = 2;
    tau_map["ExoLeftHip"] = 3;
    tau_map["ExoRightKnee"] = 4;
    tau_map["ExoRightAnkle"] = 5;
    tau_map["ExoRightHip"] = 6;
    selected_joints = {"ExoLeftHip", "ExoLeftKnee", "ExoLeftAnkle",
                       "ExoRightHip", "ExoRightKnee", "ExoRightAnkle", 
                       "ExoHipCrutches"};
    
    q = {0,0,0,0,0,0,0};
    qd = {0,0,0,0,0,0,0};
    enabled_control = false;
    
   
    client_model = n.serviceClient<rbdl_server::RBDLModel>("CreateModel");
    client_ID = n.serviceClient<rbdl_server::RBDLInverseDynamics>("InverseDynamics");
    client_controller = n.serviceClient<controller_modules::JointControl>("CalcTau");   
    ros::Subscriber sub_setpoints = n.subscribe("exo_set_points", 1000, tau_callback);
    chatter_pub = n.advertise<std_msgs::Float32MultiArray>("my_joints", 1000);
    dt_pub = n.advertise<std_msgs::Float32>("dt", 1000);
    ros::Rate rate(1000);    

    std::vector<std::string> ambf_joint_names = exo_handler->get_joint_names();
    int  index = 0;
    for( auto&& joint : ambf_joint_names)
    {
        joint_map_selected[joint] = index;
        index++;
    }

    if(ros::ok)
    {
        ROS_INFO("OK");
        rbdl_server::RBDLModel model_msg;  
        
        model_msg.request.model = actuator_config_file;
        model_msg.request.model_name = "exo";
        if (client_model.call(model_msg))
        {
            ROS_INFO("built the model");
        }
        else
        {
            ROS_INFO("Failed to call service model");
            return 1;
        }
    }
    

    ros::ServiceClient ambf2rbdl = n.serviceClient<rbdl_server::RBDLModelAlignment>("AMBF2RBDL");
    rbdl_server::RBDLModelAlignment msg;
    msg.request.model_name = "exo";

    if (ambf2rbdl.call(msg))
    {
        joint_indexs = msg.response.ids;
        joint_names = msg.response.names;
        // print then joint names

        std::transform(joint_names.begin(),
                       joint_names.end(),
                       joint_indexs.begin(),
                       std::inserter(jointMap, jointMap.end()),
                       std::make_pair<string const &, int const &>);

    }
    else
    {
        cout << ("Failed to call service joint");
        return false;
    }
    cout << "CALLING MAINLOOP" << "\n";
    main_loop();

    return 0;
}
