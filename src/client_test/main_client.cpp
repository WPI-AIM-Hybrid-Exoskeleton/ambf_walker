#include "ros/ros.h"
#include "Eigen/Core"
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
std::vector<double> q, qd;
std::map<string, int> jointMap;
ros::ServiceClient client_model; 
ros::ServiceClient client_ID; 
ros::ServiceClient client_controller;

vector<int> joint_indexs;
vector<string> joint_names;

void tau_callback(const ambf_walker::DesiredJoints joints)
{
    double start =ros::Time::now().toSec();
    
    controller_modules::JointControl joint_msg;
    rbdl_server::RBDLInverseDynamics dyn_msg;
    joint_msg.request.controller_name = joints.controller;

    joint_msg.request.actual.velocities = qd;
    joint_msg.request.actual.positions = q;
    joint_msg.request.desired.positions = joints.q;
    joint_msg.request.desired.velocities = joints.qd;

    if (client_controller.call(joint_msg))
    {
        std::vector<double> effort = joint_msg.response.control_output.effort;
        rbdl_server::RBDLInverseDynamics dyn_msg;
        dyn_msg.request.q = q;
        dyn_msg.request.qd = qd;
        dyn_msg.request.qdd = effort;

        if(client_ID.call(dyn_msg))
        {
           
            // std::vector<float> tau(dyn_msg.response.tau.begin(), dyn_msg.response.tau.end());
            // tau.erase(tau.begin());
            // std::vector<float> tau_fix = { tau[0], tau[4], tau[3],tau[1], tau[2],tau[5] };
            // my_tau.data = tau_fix;
            // handler->set_all_joint_effort(tau_fix);
            // tau_pub.publish(my_tau);
            // desired_pub.publish(desried);
            // actual_pub.publish(actual);
        }

    }
    else
    {
        ROS_INFO("Failed to call service controller");
       
    }
}


void ambf_to_rbdl(const vector<double> joints, vector<double> &joints_aligned)
{

    //map<string, int>::iterator it;
    joints_aligned = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0};
    std::vector<std::string> selected_joints = {"ExoLeftHip", "ExoLeftKnee", "ExoLeftAnkle",
                                                "ExoRightHip", "ExoRightKnee", "ExoRightAnkle", 
                                                "ExoHipCrutches"};

    int count = 0;
    for(auto&& item : selected_joints) 
    {
        int index; 
        if(  selected_joints.size() > joint_names.size() )
        {
            index =  jointMap[item];
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
    joints_aligned = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0};
    std::vector<std::string> selected_joints = {"ExoLeftHip", "ExoLeftKnee", "ExoLeftAnkle",
                                                "ExoRightHip", "ExoRightKnee", "ExoRightAnkle", 
                                                "ExoHipCrutches"};

    int count = 0;
    for(auto&& item : joint_names) 
    {
        int index; 
        if(  selected_joints.size() > joint_names.size() )
        {
            index =  jointMap[item];
        }
        else
        {
            index =  jointMap[item]-1;
        }
        joints_aligned[count] = joints[index];
        count++;
    }
}





void main_loop()
{
    


    ros::Rate loop_rate(500);    
    while(ros::ok())
    {
        std::vector<float> q_, qd_;
        q_= exo_handler->get_all_joint_pos();
        qd_ = exo_handler->get_all_joint_vel();
        
        q = std::vector<double>(q_.begin(), q_.end());
        qd = std::vector<double>(qd_.begin(), qd_.end());
        
        if( enabled_control)
        {
            exo_handler->set_multiple_joint_effort(tau);
        }
        loop_rate.sleep();
    }



}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "Main");
    const std::string actuator_config_file = "/home/nathanielgoldfarb/catkin_ws/src/ambf_controller_testing/model/exo/default.yaml";
    enabled_control = false;
    Client client;
    client.connect();
    usleep(10000);
    exo_handler = client.getRigidBody("ExoHip", true);
    ros::NodeHandle n;
    client_model = n.serviceClient<rbdl_server::RBDLModel>("CreateModel");
    client_ID = n.serviceClient<rbdl_server::RBDLInverseDynamics>("InverseDynamics");
    client_controller = n.serviceClient<controller_modules::JointControl>("CalcTau");   
    ros::Rate rate(1000);    


    if(ros::ok)
    {
        ROS_INFO("OK");
        rbdl_server::RBDLModel model_msg;  
        
        model_msg.request.model = actuator_config_file;
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

        for (auto &it : joint_indexs)
        {
            cout << it << "\n";
        }
    }
    else
    {
        cout << ("Failed to call service joint");
        return false;
    }
   
  

    return 0;
}
