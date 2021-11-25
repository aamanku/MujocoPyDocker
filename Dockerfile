# Author: amkulk@udel.edu 
# Date:11/24/21
# writing for rendering window
FROM ubuntu:20.04
# 4.10.3 latest at time of writing this script
RUN apt-get update -y; apt-get upgrade -y; apt-get -y install ssh
RUN apt install -y python3.8
RUN apt install -y python3-pip
RUN apt install -y patchelf
RUN apt install -y libosmesa6-dev libgl1-mesa-glx libglfw3 
#add pip dependencies here
RUN pip install free-mujoco-py

# importing mujoco_py once to build it
RUN python3 -c 'import mujoco_py'

RUN echo "Done....Enjoy!Make me Proud"

RUN mkdir /root/host
WORKDIR /root/host/
