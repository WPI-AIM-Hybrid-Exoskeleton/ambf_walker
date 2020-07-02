;; Auto-generated. Do not edit!


(when (boundp 'ambf_walker::DesiredJoints)
  (if (not (find-package "AMBF_WALKER"))
    (make-package "AMBF_WALKER"))
  (shadow 'DesiredJoints (find-package "AMBF_WALKER")))
(unless (find-package "AMBF_WALKER::DESIREDJOINTS")
  (make-package "AMBF_WALKER::DESIREDJOINTS"))

(in-package "ROS")
;;//! \htmlinclude DesiredJoints.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ambf_walker::DesiredJoints
  :super ros::object
  :slots (_header _q _qd _qdd _controllers ))

(defmethod ambf_walker::DesiredJoints
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:q __q) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:qd __qd) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:qdd __qdd) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:controllers __controllers) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _q __q)
   (setq _qd __qd)
   (setq _qdd __qdd)
   (setq _controllers __controllers)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:q
   (&optional __q)
   (if __q (setq _q __q)) _q)
  (:qd
   (&optional __qd)
   (if __qd (setq _qd __qd)) _qd)
  (:qdd
   (&optional __qdd)
   (if __qdd (setq _qdd __qdd)) _qdd)
  (:controllers
   (&optional __controllers)
   (if __controllers (setq _controllers __controllers)) _controllers)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _q
    (* 8    (length _q)) 4
    ;; float64[] _qd
    (* 8    (length _qd)) 4
    ;; float64[] _qdd
    (* 8    (length _qdd)) 4
    ;; string[] _controllers
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _controllers)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _q
     (write-long (length _q) s)
     (dotimes (i (length _q))
       (sys::poke (elt _q i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _qd
     (write-long (length _qd) s)
     (dotimes (i (length _qd))
       (sys::poke (elt _qd i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _qdd
     (write-long (length _qdd) s)
     (dotimes (i (length _qdd))
       (sys::poke (elt _qdd i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string[] _controllers
     (write-long (length _controllers) s)
     (dolist (elem _controllers)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _q
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _q (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _q i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _qd
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _qd (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _qd i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _qdd
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _qdd (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _qdd i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string[] _controllers
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controllers (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _controllers i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get ambf_walker::DesiredJoints :md5sum-) "6ec277a08c216dac90cc1e9402138069")
(setf (get ambf_walker::DesiredJoints :datatype-) "ambf_walker/DesiredJoints")
(setf (get ambf_walker::DesiredJoints :definition-)
      "std_msgs/Header header
float64[] q
float64[] qd
float64[] qdd
string[] controllers
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

")



(provide :ambf_walker/DesiredJoints "6ec277a08c216dac90cc1e9402138069")


