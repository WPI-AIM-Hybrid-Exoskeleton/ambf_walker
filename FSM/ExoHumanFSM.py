#!/usr/bin/env python
import sys
import smach
import smach_ros
import rospy

import InitializeState, WalkInitState, WalkState, MainState, LowerState


class ExoHumanFSM():

    def __init__(self):
        sm = smach.StateMachine(outcomes=['Done'])

        with sm:
            smach.StateMachine.add('Initialize', InitializeState.InitializeState("exo"),
                                   transitions={'Initialized': 'Main'})

            smach.StateMachine.add('Main', MainState.MainState(["Walk", "Lower", "Done"]),
                                   transitions={'Walk': 'Sub_Walk',
                                                'Lower': 'LowerBody',
                                                "Done": "Done"})

            smach.StateMachine.add('LowerBody', LowerState.LowerState("exo"),
                                   transitions={'Lowered': 'Main'})

            walk_sub = smach.StateMachine(outcomes=['walked'])

            # Open the container
            with walk_sub:
                # Add states to the container
                smach.StateMachine.add('WalkInit', WalkInitState.WalkInitState("exo"),
                                       transitions={'WalkInitialized': 'walk_con'})

                # Create the sub SMACH state machine
                walk_con = smach.Concurrence(outcomes=['walked'],
                                           default_outcome='walked',
                                           outcome_map={'walked':
                                                            {'ExoWalk': 'walked',
                                                             'HumanWalk': 'walked'}})

                # Open the container
                with walk_con:
                    # Add states to the container
                    smach.Concurrence.add('ExoWalk', WalkState.WalkState("exo", "exo"))
                    smach.Concurrence.add('HumanWalk', WalkState.WalkState("exo", "exo"))

                smach.StateMachine.add('walk_con', walk_con,
                                       transitions={'walked': 'walked'})



            smach.StateMachine.add('Sub_Walk', walk_sub,
                                   transitions={'walked': 'Main'})

        sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        sis.start()

        # Execute the state machine
        outcome = sm.execute()

        # Wait for ctrl-c to stop the application
        rospy.spin()
        sis.stop()




