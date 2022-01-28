# Author: amkulk@udel.edu 
# Date:11/24/21
# writing for rendering window

# Edits
# Date:11/25/2021
#	Added working hardware acceleration for intel see #http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration
# Date:1/28/2022
#	Added cvxpy, pyquaternion, scipy, matplotlib. see#https://stackoverflow.com/questions/63047165/simple-docker-container-to-show-matplotlib-plots
#		python3 <<EOF
#		import matplotlib
#		matplotlib.use('TkAgg')
#		import matplotlib.pyplot as plt
#		plt.plot(range(10))
#		plt.show()
#		exit()
#		EOF

#############
FROM ubuntu:20.04
# 4.10.3 latest at time of writing this script
RUN apt-get update -y; apt-get upgrade -y; apt-get -y install ssh
RUN apt install -y python3.8
RUN apt install -y python3-pip
RUN apt install -y patchelf
RUN apt install -y libosmesa6-dev libgl1-mesa-glx libglfw3 libgl1-mesa-dri
RUN apt install -y tk
RUN apt install -y python3-tk
#RUN apt install -y python3-matplolib

#http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration
RUN rm -rf /var/lib/apt/lists/*
#add pip dependencies here
RUN pip install free-mujoco-py
RUN pip install sympy
RUN pip install casadi
RUN pip install cvxpy
RUN pip install pyquaternion
RUN pip install scipy
RUN pip install matplotlib


# importing mujoco_py once to build it
RUN python3 -c 'import mujoco_py'

RUN echo "Done....Enjoy!Make me Proud"

RUN mkdir /root/host
WORKDIR /root/host/
