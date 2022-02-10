FROM ros:foxy

# Use bash instead of sh for the RUN steps
SHELL ["/bin/bash", "-c"]

# Install ros packages and dependencies
RUN apt-get update && apt-get install -y \
    # Fast DDS dependencies
    libssl-dev \
    libasio-dev \
    cmake g++ pip wget git \
    libyaml-cpp-dev \
    # Demo packages
    ros-${ROS_DISTRO}-demo-nodes-cpp

# Install latest FastDDS available in foxy
RUN apt update && apt install -y ros-foxy-fastrtps \
    ros-foxy-rmw-fastrtps-cpp \
    ros-foxy-fastrtps-cmake-module \
    ros-foxy-rmw-fastrtps-dynamic-cpp ros-foxy-rmw-fastrtps-shared-cpp \
    ros-foxy-rosidl-typesupport-fastrtps-c ros-foxy-rosidl-typesupport-fastrtps-cpp

COPY ros_entrypoint.sh /

COPY fastdds_server.xml /
COPY fastdds_client.xml /
COPY wait_for_discovery_server.sh /

RUN chmod +x /ros_entrypoint.sh
RUN chmod +x /wait_for_discovery_server.sh