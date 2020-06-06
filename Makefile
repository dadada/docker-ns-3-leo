.PHONY: configure build docker-build-image all build configure clean test compile_commands shell

DOCKER_RUN=docker run -it --mount type=bind,source="$(PWD)"/bake,target=/usr/bake ns-3-leo

all: docker-build docker-run

docker-build-image: docker/Dockerfile
	cd docker && docker build -t ns-3-leo .

bake:
	git clone https://gitlab.com/nsnam/bake.git
	mkdir -p bake/contrib
	cp ns-3-leo.xml bake/contrib

configure: docker-build-image bake
	$(DOCKER_RUN) /bin/bash -c './bake.py configure -e ns-3-leo && ./bake.py check && ./bake.py download'

build: docker-build-image bake
	$(DOCKER_RUN) ./bake.py build -vvv

clean: docker-build-image
	$(DOCKER_RUN) ./bake.py clean

test: docker-build-image
	$(DOCKER_RUN) /bin/bash -c 'cd source/ns-3-leo/ && ./test.py'

compile_commands: docker-build-image
	$(DOCKER_RUN) /bin/bash -c "bear ./bake.py build"

shell:
	$(DOCKER_RUN) /bin/bash
