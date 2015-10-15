run:
	docker run -d --name fail2ban --privileged --net=host $(DOCKER_TAG)
build:
	docker build --rm -t $(DOCKER_TAG) .
	docker push $(DOCKER_TAG)
