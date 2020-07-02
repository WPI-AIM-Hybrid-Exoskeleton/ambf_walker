
(cl:in-package :asdf)

(defsystem "ambf_walker-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "DesiredJoints" :depends-on ("_package_DesiredJoints"))
    (:file "_package_DesiredJoints" :depends-on ("_package"))
  ))