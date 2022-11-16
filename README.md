# tb2_rocker

### Terminal 1
```
./run.bash
source /opt/ros/kinetic/setup.bash
export TURTLEBOT_GAZEBO_WORLD_FILE=/opt/ros/kinetic/share/turtlebot_gazebo/worlds/corridor.world
roslaunch turtlebot_gazebo turtlebot_world.launch
```

### Terminal 2
```
./terminal.bash
source /opt/ros/kinetic/setup.bash
rosparam load config/tb2_bridge.yaml
rosrun topic_tools transform /scan /new_scan sensor_msgs/LaserScan 'sensor_msgs.msg.LaserScan(header=std_msgs.msg.Header(seq=m.header.seq,stamp=m.header.stamp,frame_id="camera_depth_frame"),angle_min=m.angle_min,angle_max=m.angle_max,angle_increment=m.angle_increment,time_increment=m.time_increment,scan_time=m.scan_time,range_min=m.range_min,range_max=m.range_max,ranges=m.ranges, intensities=m.intensities)' --import sensor_msgs std_msgs
```

### Terminal 3
```
docker compose up
```

### Terminal 4
```
xhost +
docker run --env="USER=eiforamr" --name ei4amr-full \
  --env="DISPLAY=$DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd)/config:/config \
  --network tb2_rocker_default --rm -it eiforamr-full-flavour-sdk:2022.3 \
  /bin/bash
rviz2 -d /config/nav.rviz
```

### Terminal 5
```
docker exec -it ei4amr-full /bin/bash
source /opt/ros/foxy/setup.bash
ros2 launch nav2_bringup navigation_launch.py use_sim_time:=true
```

### Terminal 6
```
docker exec -it ei4amr-full /bin/bash
source /opt/ros/foxy/setup.bash
ros2 launch slam_toolbox online_async_launch.py use_sim_time:=true
```

### Terminal 7
```
docker exec -it ei4amr-full /bin/bash
source /opt/ros/foxy/setup.bash
ros2 run teleop_twist_keyboard teleop_twist_keyboard
```
