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

## Starting Container with shared x display in vscode
Run `sh StartContainer.sh`. Keep the terminal open with bash running.

Go to `Remote Explorer` tab on VSCode 

![tabs](https://user-images.githubusercontent.com/55757512/143385420-068882db-b4a1-4411-af30-27508d1ed99e.png)

Find `mjdocker mjdocker_container` and click on `Attach to Container` (+ window)

![atach](https://user-images.githubusercontent.com/55757512/143385830-92691525-243e-49bf-963f-71038b041a20.png)

New window will open with bottom bar saing working in container

![lowbar](https://user-images.githubusercontent.com/55757512/143386021-559a0ee3-b4f7-4da0-b78e-418faf04739b.png)

You may have to install extensions again in the container for python editing or other languages. Do as you wish.

Run `testmj.py` from the current workspace. The workspace should be same folder where the `StartContainer.sh` script was ran. You should see the humanoid falling

![Screenshot from 2021-11-25 00-45-56](https://user-images.githubusercontent.com/55757512/143386718-66967879-62f6-4f7d-9d2b-e40fa0557f64.png)


Finally close the Container bash by typing `exit` in the terminal where `StartContainer.sh` was ran.

## On Windows
Yes you read it right. We can run the docker container on wsl2.
[Install WSL](https://docs.microsoft.com/en-us/windows/wsl/install) and enable wsl2, lookup tutorials on internet. Install Ubuntu 20.04 available from Microsoft Store.

[Install Docker](https://docs.docker.com/desktop/windows/install/).

Once you access to ubuntu terminal change directory to one containing files in this repo.

Run `docker build -t mjdocker .` to build the image. After run it `docker run --rm -it mjdocker bash`. You will see your container in windows docker GUI.

### Rendering on windows
I followed steps in this [link](https://marinerobotics.gtorg.gatech.edu/running-ros-with-gui-in-docker-using-windows-subsystem-for-linux-2-wsl2/).

Install X server for windows VcXsrv.

Run the X server on windows and start container in the ubuntu terminal with command `docker run --rm -it --name mjdocker_container -e DISPLAY=host.docker.internal:0.0 -e LIBGL_ALWAYS_INDIRECT=0 mjdocker bash`.

You should be able to see graphics output on VcXsrv window when you use MjViewer in the container. You should be able to start developing in VSCode similar as in native Ubuntu.




