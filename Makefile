PWD:= $(shell pwd -L)
ME:= $(shell whoami)
DOCKER_IMAGE:= php:fpm-alpine

default: clean build permission

clean:
	rm -f phalcon.so

build:
	docker run -it --rm -v ${PWD}:/data -w /data ${DOCKER_IMAGE} /data/build.sh

permission:
	sudo chown ${ME}:${ME} phalcon.so

.PHONY: default
