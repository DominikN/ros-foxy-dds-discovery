#!/bin/bash
set -e

# setup ros2 environment
source /opt/ros/foxy/setup.bash

# setup Fast DDS RMW
export RMW_IMPLEMENTATION=rmw_fastrtps_cpp

exec "$@"
