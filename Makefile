IMAGE ?= rizort/wrk2:latest

build:
	docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)