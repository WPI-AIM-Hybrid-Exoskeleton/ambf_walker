#!/usr/bin/env python
import sys
import smach
import smach_ros
import rospy

import InitializeState, WalkInitState, WalkState, MainState, LowerState, InitilizeHumanState, WalkSimulinkState


class ExoHumanFSM():

    def __init__(self):
        sm = smach.StateMachine(outcomes=['Done'])

        with sm:
            smach.StateMachine.add('Initialize', InitializeState.InitializeState("exo"),
                                   transitions={'Initialized': 'Main'})

            smach.StateMachine.add('Main', MainState.MainState(["Walk", "Lower", "Done", "Sim"]),
                                   transitions={'Walk': 'Sub_Walk',
                                                'Lower': 'LowerBody',
                                                "Done": "Done",
                                                "Sim":'Simulink_Walk'})

            smach.StateMachine.add('LowerBody', LowerState.LowerState("exo"),
                                   transitions={'Lowered': 'Main'})

            walk_sub = smach.StateMachine(outcomes=['walked'])

            simulink_sub = smach.StateMachine(outcomes=['walked'])


            with simulink_sub:
                # Add states to the container
                smach.StateMachine.add('WalkInit', WalkInitState.WalkInitState("exo"),
                                       transitions={'WalkInitialized': 'Humaninit'},
                                       remapping={'human':'status',
                                                  'q':'q',
                                                  'qd':'qd'})

                smach.StateMachine.add('Humaninit', InitilizeHumanState.InitializeState(),
                                       transitions={'on':'WalkSimulink','off':'walked' },
                                       remapping={'status':'status',
                                                  'q':'q',
                                                  'qd':'qd'})

                smach.StateMachine.add('WalkSimulink', WalkSimulinkState.WalkSimulinkState("exo", "Dyn"),
                                       transitions={'walked':'walked'},
                                       remapping={'q':'q',
                                                  'qd':'qd'})


        # Open the container
            with walk_sub:
                # Add states to the container
                smach.StateMachine.add('WalkInit', WalkInitState.WalkInitState("exo"),
                                       transitions={'WalkInitialized': 'Humaninit'},
                                       remapping={'human':'status',
                                                        'q':'q',
                                                        'qd':'qd'})

                smach.StateMachine.add('Humaninit', InitilizeHumanState.InitializeState(),
                                       transitions={'on':'walk_con','off':'walked' },
                                       remapping={'status':'status',
                                                        'q':'q',
                                                        'qd':'qd'})

                # Create the sub SMACH state machine
                walk_con = smach.Concurrence(outcomes=['walked'],
                                           default_outcome='walked',
                                           outcome_map={'walked':
                                                            {'ExoWalk': 'walked',
                                                             'HumanWalk': 'walked'}},
                                                             input_keys=['q', 'qd'],
                                                             output_keys=["human"])

                # Open the container
                with walk_con:
                    # Add states to the container
                    smach.Concurrence.add('ExoWalk', WalkState.WalkState("exo", "NoGains") ,remapping={'q':'q',
                                          'qd':'qd'})
                    smach.Concurrence.add('HumanWalk', WalkState.WalkState("human", "human"),
                                   remapping={'q':'q',
                                          'qd':'qd'})

                smach.StateMachine.add('walk_con', walk_con,
                                       transitions={'walked': 'Humaninit'},
                                       remapping={"human":"status",
                                                 'q':'q',
                                                 'qd':'qd'})



            smach.StateMachine.add('Sub_Walk', walk_sub,
                                   transitions={'walked': 'Initialize'})

            smach.StateMachine.add('Simulink_Walk', simulink_sub,
                                   transitions={'walked': 'Initialize'})


        sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        sis.start()

            # Execute the state machine
        outcome = sm.execute()

        # Wait for ctrl-c to stop the application
        rospy.spin()
        sis.stop()





if __name__ == "__main__":

    rospy.init_node("FSM")
    ExoHumanFSM()
