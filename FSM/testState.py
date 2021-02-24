#!/usr/bin/env python

import rospy
import smach
import smach_ros

# define state Foo
class Foo(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome1','outcome2'])
        self.counter = 0

    def execute(self, userdata):
        rospy.loginfo('Executing state FOO')
        if self.counter < 3:
            self.counter += 1
            return 'outcome1'
        else:
            return 'outcome2'


# define state Bar
class Bar(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome1'])

    def execute(self, userdata):
        rospy.loginfo('Executing state BAR')
        return 'outcome1'
        



# define state Foo
class Foo2(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome12','outcome22'])
        self.counter = 0

    def execute(self, userdata):
        rospy.loginfo('Executing state FOO')
        if self.counter < 3:
            self.counter += 1
            return 'outcome12'
        else:
            return 'outcome22'


# define state Bar
class Bar2(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome12'])

    def execute(self, userdata):
        rospy.loginfo('Executing state BAR2')
        return 'outcome12'


# define state Bas
class Bas(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=['outcome3','outcome32'])

    def execute(self, userdata):
        rospy.loginfo('Executing state BAS')
        return 'outcome3'




def main():
    rospy.init_node('smach_example_state_machine')

    # Create the top level SMACH state machine
    sm_top = smach.StateMachine(outcomes=['outcome5','outcome52'])
    
    # Open the container
    with sm_top:

        smach.StateMachine.add('BAS', Bas(),
                               transitions={'outcome3':'SUB1',
                                            'outcome32':'SUB2'})

        # Create the sub SMACH state machine
        sm_sub1 = smach.StateMachine(outcomes=['outcome4'])
        sm_sub2 = smach.StateMachine(outcomes=['outcome42'])

        # Open the container
        with sm_sub1:

            # Add states to the container
            smach.StateMachine.add('FOO', Foo(), 
                                   transitions={'outcome1':'BAR', 
                                                'outcome2':'outcome4'})
            smach.StateMachine.add('BAR', Bar(), 
                                   transitions={'outcome1':'FOO'})

            
            
            
        smach.StateMachine.add('SUB1', sm_sub1,
                               transitions={'outcome4':'outcome5'})




        with sm_sub2:

            # Add states to the container
            smach.StateMachine.add('FOO2', Foo2(), 
                                   transitions={'outcome12':'BAR2', 
                                                'outcome22':'outcome42'})
            smach.StateMachine.add('BAR2', Bar2(), 
                                   transitions={'outcome12':'FOO2'})

        smach.StateMachine.add('SUB2', sm_sub2,
                               transitions={'outcome42':'outcome52'})


    # Execute SMACH plan
    sis = smach_ros.IntrospectionServer('server_name', sm_top, '/SM_ROOT')
    sis.start()

    # Execute the state machine
    outcome = sm_top.execute()

    # Wait for ctrl-c to stop the application
    rospy.spin()
    sis.stop()



if __name__ == '__main__':
    main()