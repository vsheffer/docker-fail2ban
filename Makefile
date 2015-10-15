run:
	docker run -d --name fail2ban --privileged --net=host ianblenke/fail2ban
build:
	docker build --rm -t $(DOCKER_TAG) .
	docker push $(DOCKER_TAG)
