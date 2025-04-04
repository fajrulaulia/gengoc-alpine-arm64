IMAGE_NAME=faawidia/gengoc-alpine-arm64
TAG=latest

build:
	docker build -t $(IMAGE_NAME):$(TAG) .

run:
	docker run --rm --name gengoc $(IMAGE_NAME):$(TAG)

run-protoc:
	docker run --rm --name gengoc \
         -v "./example/:/fw/proto/" \
         -v "./generated:/fw/generated" \
           $(IMAGE_NAME):$(TAG)

run-daemon:
	docker run -d --name gengoc $(IMAGE_NAME):$(TAG)

logs:
	docker logs -f gengoc

clean:
	docker rm -f gengoc || true
	docker rmi -f $(IMAGE_NAME):$(TAG) || true

push:
	docker push $(IMAGE_NAME):$(TAG)
