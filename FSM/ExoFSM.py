#!/usr/bin/env python
import sys
import smach
import smach_ros
import rospy

import InitializeState, WalkInitState, WalkState, MainState, LowerState, iLQRState, RaiseLegState, ForwardLegState, StepState


class ExoFSM():

    def __init__(self):  

        sm = smach.StateMachine(outcomes=['Done'])

        with sm:
            smach.StateMachine.add('Initialize', InitializeState.InitializeState("exo"), transitions={'Initialized': 'Main'})
            
            smach.StateMachine.add('Main', MainState.MainState(["Walk", "Lower", "Done", "ilqr", "raise","step"] ),
                            transitions={'Walk': 'Sub_Walk', 
                                        'Lower': 'LowerBody',
                                        "ilqr":"Sub_ILQR",
                                        "Done": "Done" ,
                                        "raise": "LeftRaiseLeg",
                                         "step": "TakeStep"})


            smach.StateMachine.add('TakeStep', StepState.StepState("exo", "Dyn2"),
                                   transitions={'Stepped': 'Main'},
                                   remapping={'q':'q', 'qd':'qd'})


            smach.StateMachine.add('LowerBody', LowerState.LowerState("exo"),
                                    transitions={'Lowered': 'Main'})


            smach.StateMachine.add('LeftRaiseLeg', RaiseLegState.RaiseLegState("exo", 0),
                                   transitions={'Raised': 'LeftForwardLeg'})


            smach.StateMachine.add('LeftForwardLeg', ForwardLegState.ForwardLegState("exo" , 0),
                                   transitions={'Forwarded': 'RightRaiseLeg'})

            smach.StateMachine.add('RightRaiseLeg', RaiseLegState.RaiseLegState("exo", 1),
                                   transitions={'Raised': 'RightForwardLeg'})

            smach.StateMachine.add('RightForwardLeg', ForwardLegState.ForwardLegState("exo", 1),
                               transitions={'Forwarded': 'LeftRaiseLeg'})

            walk_sub = smach.StateMachine(outcomes=['walked'])
            ilqr_sub = smach.StateMachine(outcomes=['ilqred'])

            # Open the container 
            with walk_sub:

                # Add states to the container 
                smach.StateMachine.add('WalkInit', WalkInitState.WalkInitState("exo"),
                                    transitions={'WalkInitialized':'Walk'},
                                       remapping={'q':'q',
                                          'qd':'qd'} )

                smach.StateMachine.add('Walk', WalkState.WalkState("exo", "Dyn"),
                                    transitions={'walked':'walked'},
                                       remapping={'q':'q',
                                          'qd':'qd'})


            smach.StateMachine.add('Sub_Walk', walk_sub,
                                transitions={'walked':'Initialize'})
        

            with ilqr_sub:

                # Add states to the container
                smach.StateMachine.add('LQRInit', WalkInitState.WalkInitState("exo"),
                                    transitions={'WalkInitialized':'ILQR'},
                                       remapping={'q':'q', 'qd':'qd'} )

                smach.StateMachine.add('ILQR', iLQRState.iLQRState("exo", "FF"),
                                    transitions={'ilqred':'ilqred'},
                                       remapping={'q':'q', 'qd':'qd'})


            smach.StateMachine.add('Sub_ILQR', ilqr_sub,
                                transitions={'ilqred':'Initialize'})


        sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        sis.start()

        # Execute the state machine
        outcome = sm.execute()

        # Wait for ctrl-c to stop the application
        rospy.spin()
        sis.stop()



if __name__ == '__main__':
    rospy.init_node("FSM")
    ExoFSM()

