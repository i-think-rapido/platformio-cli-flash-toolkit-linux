`dirname $0`/kill-docker.sh
docker run -d --restart always --privileged -v /dev/bus/usb:/dev/bus/usb -v `pwd`:/prj --name pio pio
