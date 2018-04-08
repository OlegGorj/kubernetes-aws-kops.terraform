NAME = $(shell awk -F\" '/^\t+name / { print $$2 }' ./main.go)
VERSION = $(shell awk -F\" '/^\t+version / { print $$2 }' ./main.go)
REPO = ryane

# step to build main.go binaries
build: $(shell find . -name '*.go')
	go build

# step to build binaries of main.go and create image out of dockerfile that uses binaries file
docker: $(shell find . -name '*.go')
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .
	docker build --force-rm --rm -t ${REPO}/${NAME}:${VERSION} .
	rm -f main

# push to hub.docker. For name and version of the image, see main.go file
push: docker
	docker push ${REPO}/${NAME}:${VERSION}
