# Makefile based on "azukiapp/node"
# Many thanks for Azukki team <3

ROOT_PATH := $(shell pwd)
IMAGE_NAME := "ninicons/node"

# bins
DOCKER := $(shell which adocker || which docker)

all: build test

build:
	${DOCKER} build -t ${IMAGE_NAME}:latest     6
	${DOCKER} build -t ${IMAGE_NAME}:4				  4

build-no-cache:
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:latest     6
	${DOCKER} build --rm --no-cache -t ${IMAGE_NAME}:4			    4

test:
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:latest   bash /tmp/run-app-test.sh
	${DOCKER} run -it -v `pwd`:/tmp ${IMAGE_NAME}:4			   bash /tmp/run-app-test.sh

.PHONY: all build build-no-cache test
