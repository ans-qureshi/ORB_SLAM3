#!/bin/bash

# Start roscore in the background
roscore &

# Wait for roscore to start (e.g., sleep for 5 seconds)
sleep 5

# Start the ORB_SLAM3 node
rosrun ORB_SLAM3 Mono Vocabulary/ORBvoc.txt Examples_old/Monocular-Inertial/EuRoC.yaml 
