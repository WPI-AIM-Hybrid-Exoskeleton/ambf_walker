// Auto-generated. Do not edit!

// (in-package ambf_walker.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class DesiredJoints {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.q = null;
      this.qd = null;
      this.qdd = null;
      this.controllers = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('q')) {
        this.q = initObj.q
      }
      else {
        this.q = [];
      }
      if (initObj.hasOwnProperty('qd')) {
        this.qd = initObj.qd
      }
      else {
        this.qd = [];
      }
      if (initObj.hasOwnProperty('qdd')) {
        this.qdd = initObj.qdd
      }
      else {
        this.qdd = [];
      }
      if (initObj.hasOwnProperty('controllers')) {
        this.controllers = initObj.controllers
      }
      else {
        this.controllers = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type DesiredJoints
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [q]
    bufferOffset = _arraySerializer.float64(obj.q, buffer, bufferOffset, null);
    // Serialize message field [qd]
    bufferOffset = _arraySerializer.float64(obj.qd, buffer, bufferOffset, null);
    // Serialize message field [qdd]
    bufferOffset = _arraySerializer.float64(obj.qdd, buffer, bufferOffset, null);
    // Serialize message field [controllers]
    bufferOffset = _arraySerializer.string(obj.controllers, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type DesiredJoints
    let len;
    let data = new DesiredJoints(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [q]
    data.q = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [qd]
    data.qd = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [qdd]
    data.qdd = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [controllers]
    data.controllers = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 8 * object.q.length;
    length += 8 * object.qd.length;
    length += 8 * object.qdd.length;
    object.controllers.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ambf_walker/DesiredJoints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6ec277a08c216dac90cc1e9402138069';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new DesiredJoints(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.q !== undefined) {
      resolved.q = msg.q;
    }
    else {
      resolved.q = []
    }

    if (msg.qd !== undefined) {
      resolved.qd = msg.qd;
    }
    else {
      resolved.qd = []
    }

    if (msg.qdd !== undefined) {
      resolved.qdd = msg.qdd;
    }
    else {
      resolved.qdd = []
    }

    if (msg.controllers !== undefined) {
      resolved.controllers = msg.controllers;
    }
    else {
      resolved.controllers = []
    }

    return resolved;
    }
};

module.exports = DesiredJoints;
