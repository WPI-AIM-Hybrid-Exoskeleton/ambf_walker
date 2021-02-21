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
std::map<std::string, int> tau_map;
std::vector<double> q, qd;
std::map<std::string, int> jointMap;
ros::ServiceClient client_model; 
ros::ServiceClient client_ID; 
ros::ServiceClient client_controller;
std::vector<std::string> selected_joints;
vector<int> joint_indexs;
vector<string> joint_names;




void ambf_to_rbdl(const vector<double> joints, vector<double> &joints_aligned)
{

    //map<string, int>::iterator it;
    joints_aligned = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0,0.0};

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


void tau_callback(const ambf_walker::DesiredJoints joints)
{
    double start =ros::Time::now().toSec();
    
    controller_modules::JointControl joint_msg;
    rbdl_server::RBDLInverseDynamics dyn_msg;
    joint_msg.request.controller_name = joints.controller;
    std::vector<double> q_aligned, qd_aligned,q_aligned_desired, qd_aligned_desired;

    ambf_to_rbdl(qd, qd_aligned);
    ambf_to_rbdl(q, q_aligned);
    ambf_to_rbdl(joints.q, qd_aligned_desired);
    ambf_to_rbdl(joints.q, q_aligned_desired);

    joint_msg.request.actual.velocities = qd_aligned;
    joint_msg.request.actual.positions = q_aligned;
    joint_msg.request.desired.positions = q_aligned_desired;
    joint_msg.request.desired.velocities = qd_aligned_desired;

    if (client_controller.call(joint_msg))
    {
        std::vector<double> effort = joint_msg.response.control_output.effort;
        rbdl_server::RBDLInverseDynamics dyn_msg;
        dyn_msg.request.q = q;
        dyn_msg.request.qd = qd;
        dyn_msg.request.qdd = effort;

        if(client_ID.call(dyn_msg))
        {
            int count = 0;
            std::vector<double> tau_aligned;
            ambf_to_rbdl(dyn_msg.response.tau, q_aligned_desired); 

            for(auto&& item : selected_joints) 
            {
                tau[tau_map[item]] = tau_aligned[count]; 
                count++;
            }
        }
        else
        {
        ROS_INFO("Failed to call service dynamics");
       
        }
    }
    else
    {
        ROS_INFO("Failed to call service controller");
       
    }
}


std::vector<double> get_q()
{
    std::vector<float> q_ = exo_handler->get_all_joint_pos();
    std::vector<double> joints = {0,0,0,0,0,0,0};
    int count = 0;
    for(auto&& joint : selected_joints) 
    {

        int index = jointMap[joint];
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

        int index = jointMap[joint];
        joints[count] = (double)qd_[index];
        count++;
    }

    return joints;

}

void main_loop()
{
    
    ros::Rate loop_rate(500);    
    while(ros::ok())
    {
        std::vector<float> q_, qd_;
        // q_= exo_handler->get_all_joint_pos();
        // qd_ = exo_handler->get_all_joint_vel();
        
        // q = std::vector<double>(q_.begin(), q_.end());
        // qd = std::vector<double>(qd_.begin(), qd_.end());
        

        q = get_q();
        qd = get_qd();

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
