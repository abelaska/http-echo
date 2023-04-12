OWNER ?= abelaska
NAME ?= http-echo
TAG ?= latest
DOCKER_REGISTRY ?= ghcr.io
DOCKER_IMAGE := "$(DOCKER_REGISTRY)/$(OWNER)/$(NAME):$(TAG)"

build:
	@echo "==> Building ${1} Docker container for ${NAME}"
	@podman buildx build -t $(DOCKER_IMAGE) . \
		--platform=linux/amd64 \
		--annotation "org.opencontainers.image.source=https://github.com/$(OWNER)/$(NAME)" \
		--annotation "org.opencontainers.image.description=HTTP Echo"

push:
	@echo "==> Pushing ${1} to Docker registry"
	@podman push "$(DOCKER_IMAGE)"

dev: build
	@podman run -ti --rm -p 8080:8080 $(DOCKER_IMAGE)
