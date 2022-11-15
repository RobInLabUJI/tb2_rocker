FROM osrf/ros:kinetic-desktop-full

RUN apt-get update && apt-get install -y \
  ros-kinetic-turtlebot-description \
  ros-kinetic-turtlebot-teleop \
  ros-kinetic-turtlebot-gazebo \
  ros-kinetic-turtlebot-rviz-launchers \
  && rm -rf /var/lib/apt/lists/*
