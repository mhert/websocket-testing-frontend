NAME = websocket-testing-frontend
REGISTRY =
VERSION = 1.0.0

IMAGE_NAME = $(NAME):$(VERSION)
IMAGE_PATH = $(REGISTRY)/$(IMAGE_NAME)

.PHONY: all build push

all: build

build:
	docker build -t $(IMAGE_NAME) --rm .

push: build
	docker tag $(IMAGE_NAME) $(IMAGE_PATH)
	docker push $(IMAGE_PATH)
