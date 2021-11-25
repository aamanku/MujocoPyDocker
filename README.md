# MujocoPyDocker
Dockerizing Mujoco_py.

I am a Grad Student and need it for simulating robots!

Working on Ubuntu 20.04 LTS

## Installing Docker
Follow steps from the official Docker [site](https://docs.docker.com/engine/install/ubuntu/)

Make docker usable by non-root user [site](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

Or Install using `sudo sh InstallDocker.sh` script.

Run `docker run hello-world` to see if everything is working.

## Building Container
We will be using a [Ubuntu 20.04 image](https://hub.docker.com/_/ubuntu) as the base.

Run `docker build -t mjdocker .` (don't forget .) with `Dockerfile` in the directory.

After build is complete you can access container's bash with `docker run --rm -it mjdocker bash`.

## Setting up VSCode
Install vscode by downloading it from offical [website](https://code.visualstudio.com/download)

Install `Python`, `Docker`, and `Remote-Containers` extensions
![Extensions](https://user-images.githubusercontent.com/55757512/143383724-62203620-e51e-471d-a67e-5dbf40c53591.png)
