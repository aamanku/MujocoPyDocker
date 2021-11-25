# Expose the X server on the host.
sudo xhost +local:root # --rm: Make the container ephemeral (delete on exit).

#http://wiki.ros.org/docker/Tutorials/GUI

# -it: Interactive TTY.
# --gpus all: Expose all GPUs to the container.
# --rm removes the container after it is stopped
docker run --rm -it -v $(pwd):/root/host -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 --name mjdocker_container mjdocker bash

#docker stop mjdocker_container
sudo xhost -local:root
