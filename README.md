# MujocoPyDocker
Dockerizing Mujoco_py.

I am a Grad Student and need it for simulating robots!

## Installing Docker
Follow steps from the official Docker [site](https://docs.docker.com/engine/install/ubuntu/)

Or Install using `sudo sh InstallDocker.sh` script.

Run `sudo docker run hello-world` to see if everything is working.

## Building Container
We will be using a [miniconda image](https://hub.docker.com/r/continuumio/miniconda3) as the base.

Run `sudo docker build -t mjdocker .` (don't forget .) with `Dockerfile` and `environment.yml` in the same directory.

After build is complete you can access container's bash with `sudo docker run --rm -it mjdocker bash`.


