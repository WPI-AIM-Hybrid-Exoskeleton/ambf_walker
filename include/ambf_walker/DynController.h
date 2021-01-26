#ifndef DYNCONTROLLER_H
#define DYNCONTROLLER_H
#include <Eigen/Core>
#include "controller_modules/ControllerBase.h"
#include "controller_modules/PDController.h"
#include <iostream>

class DynController : public ControllerBase
{
     public:

          DynController(const std::string, const PDController&);
          ~DynController();
          std::string model_name;
          PDController controller;
          void update(const trajectory_msgs::JointTrajectoryPoint&, const  trajectory_msgs::JointTrajectoryPoint&, std::vector<double>&);
     private:

          
};


#endif
