# Platformio CLI in a Docker Container with convenience Shell Scripts

This guide helps you set up a command line flashing environment for 
embedded systems supported by platformio for linux based systems
(unfortunately not WSL).

The idea for this development setup is, that you have the platformio IDE
running on your system for editing the source code and having the 
docker container of this repo active, while executing the flash command
of this repository in a terminal console as described later in this readme 
file.

---

The necessity for this approach is routed in the circumstance,
that the Platform.io-IDE is not working properly on NixOS.

The following walkthrough helps patching the `/dev` folder into
the docker container, so it is available with root access.

For further usage, we use the platformio CLI within the container.
This wraps the toolchain in a consistant and safe environment.

**Restrictions**
    
This project runs on Linux systems only. (no WSL)

**Prerequisites** 

The docker engine must be running on your linux system. 
For installing the docker engine, look at the [installations guide (ubuntu)](https://docs.docker.com/engine/install/ubuntu/). 
Other installation guides must be looked up on the internet.

## One-Time Setup

First we need to create the docker image.

```bash
# in this projects folder
./build.sh
```

## Working on your Project

When starting the work of your project, you must assure, that
the controller is attached to your usb port and powered up.

Ensure that the controller is available in the `/dev` folder.
Usually this is `/dev/ttyUSB0`, but can be different, 
depending on circumstances on your OS.

The presense of this device ensures the proper patching into the
docker container. If you try to spin up the container before the USB device is attached to the computer, 
it won't be availabe in the container despite you attached your device at a later point in time. 
(This is a common mistake, so be warned.)

    All following commands have to be executed within
    your project's folder.

So, at the start of your programming session, you have to spin up the container each time.

```bash
# in the platformio projects folder
<path-to-this-project>/run-docker.sh
```

Try this procedure first, when you have trouble setting up the
development environment.

## One-time setup of your project

With a new arduino project, we must prepare the project for usage with these scripts.



    For the following steps, it is assumed, that the container is already running.

```bash
# in the platformio projects folder
<path-to-this-project>/install.sh
```

This ensures, that the project is properly set up.

Always repeat this step, when your change values in the `platformio.ini` config file,
like changing the board or the baud rate in your platformio IDE.

## Your Working Session

1. Init the project (once)

```bash
# in the platformio projects folder
<path-to-this-project>/init.sh
```

2. Upload your flash image (repeated)

    Make sure, that you set your embedded device in upload mode for the second step.

```bash
# in the platformio projects folder
<path-to-this-project>/uplaod.sh
```
(Set the device name to your needs.)

This will build the firmware and flash your device.

---

I hope you'll find this project useful.
