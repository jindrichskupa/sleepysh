# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOLIST=$(GOCMD) list
GOTEST=$(GOCMD) test
GOVET=$(GOCMD) vet
GOFMT=$(GOCMD) fmt
BINARY_NAME=sleepysh
BINARY_NAME_AMD64=$(BINARY_NAME)_linux_amd64
BINARY_NAME_ARM64=$(BINARY_NAME)_linux_arm64


all: test build
build: amd64 arm64

test:
				$(GOFMT) $(shell $(GOLIST) ./... | grep -v /vendor/)
				$(GOVET) $(shell $(GOLIST) ./... | grep -v /vendor/)
				$(GOTEST) -cover -race $(shell $(GOLIST) ./... | grep -v /vendor/)
clean:
				$(GOCLEAN)
				rm -f $(BINARY_NAME)
run: build
				./$(BINARY_NAME)

# Cross compilation
arm64:
				CGO_ENABLED=0 GOOS=linux GOARCH=arm64 $(GOBUILD) -o $(BINARY_NAME_ARM64) -v .
# Cross compilation
amd64:
				CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_NAME_AMD64) -v .
