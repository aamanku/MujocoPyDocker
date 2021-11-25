# Author: amkulk@udel.edu 
# Date:11/24/21
# Based on: Script from https://www.youtube.com/watch?v=VSv4fBDDy2I
FROM continuumio/miniconda3:4.10.3 
# 4.10.3 latest at time of writing this script
RUN apt-get update -y; apt-get upgrade -y; apt-get -y install ssh
RUN apt-get -y install gcc #needed for free-mujoco-py
RUN apt-get -y install libosmesa6-dev libgl1-mesa-glx libglfw3 # for mujoco-py

#miniconda3 doesnt come with opengl libs installing those 
#https://medium.com/@benjamin.botto/opengl-and-cuda-applications-in-docker-af0eece000f1
RUN apt-get -y install libglvnd0 libgl1 libglx0 libegl1 libglvnd-dev libgl1-mesa-dev libegl1-mesa-dev libxext6 libx11-6

#make things easier with environment
COPY environment.yml environment.yml
RUN conda env create -f environment.yml

RUN echo "source activate mjdocker" >> ~/.bashrc



ENV CONDA_EXE /opt/conda/bin/conda
ENV CONDA_PREFIX /opt/conda/envs/mjdocker
ENV CONDA_PYTHON_EXE /opt/conda/bin/python
ENV CONDA_PROMPT_MODIFIER (mjdocker)
ENV CONDA_DEFAULT_ENV mjdocker
ENV PATH /opt/conda/envs/mjdocker/bin:/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
 
# importing mujoco_py once to build it
RUN /opt/conda/envs/mjdocker/bin/python -c 'import mujoco_py'

RUN echo "Done....Enjoy!Make me Proud"
