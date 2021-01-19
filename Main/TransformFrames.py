#!/usr/bin/env python
import rospy
from sensor_msgs.msg import PointCloud2
from ambf_msgs.msg import RigidBodyState
from ambf_msgs.msg import CameraState
import tf_conversions
import tf2_ros
import geometry_msgs.msg
from tf.transformations import euler_from_quaternion, quaternion_from_euler


def body_callback(msg):
    """
    :type msg RigidBodyState
    :param msg:
    :return:
    """

    """
       :type msg: CameraState
       :param msg:
       :return:
       """
    br = tf2_ros.TransformBroadcaster()
    t = geometry_msgs.msg.TransformStamped()

    t.header.stamp = rospy.Time.now()
    t.header.frame_id = "/map"
    t.child_frame_id = "/exoskeleton"
    t.transform.translation.x = msg.pose.position.x
    t.transform.translation.y = msg.pose.position.y
    t.transform.translation.z = msg.pose.position.z
    t.transform.rotation.x = msg.pose.orientation.x
    t.transform.rotation.y = msg.pose.orientation.y
    t.transform.rotation.z = msg.pose.orientation.z
    t.transform.rotation.w = msg.pose.orientation.w

    br.sendTransform(t)


def camera_callback(msg):

    """
    :type msg: CameraState
    :param msg:
    :return:
    """
    br = tf2_ros.TransformBroadcaster()
    t = geometry_msgs.msg.TransformStamped()

    t.header.stamp = rospy.Time.now()
    t.header.frame_id = "/exoskeleton"
    t.child_frame_id = "/depth_camera"
    t.transform.translation.x = msg.pose.position.x
    t.transform.translation.y = msg.pose.position.y
    t.transform.translation.z = msg.pose.position.z

    orientation_q = msg.pose.orientation
    orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
    (roll, pitch, yaw) = euler_from_quaternion(orientation_list)
    quat = quaternion_from_euler(roll, pitch,  yaw)

    t.transform.rotation.x = orientation_list[0]
    t.transform.rotation.y = orientation_list[1]
    t.transform.rotation.z = orientation_list[2]
    t.transform.rotation.w = orientation_list[3]

    br.sendTransform(t)


if __name__ == '__main__':
    rospy.init_node("listener")
    rospy.Subscriber("/ambf/env/ExoHip/State", RigidBodyState, body_callback )
    rospy.Subscriber("/ambf/env/cameras/depth_camera/State", CameraState, camera_callback  )
    rospy.spin()