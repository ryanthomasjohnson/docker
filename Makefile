IMAGES=ssh dev
REPO=ryanjohnson
BUILD=BUILD
DOCKER_FILES = $(addsuffix /Dockerfile, $(IMAGES))
BUILD_FILES = $(addsuffix /$(BUILD), $(IMAGES))

.PHONY: all
all: $(BUILD_FILES)

dev/$(BUILD): ssh/$(BUILD)

$(BUILD_FILES): %/$(BUILD): %/Dockerfile
	docker build -t $(REPO)/$* -f $< $*
	date > $@

.PHONY: push
push: $(BUILD_FILES)
	$(patsubst %/$(BUILD),docker push $(REPO)/%;,$^)

.PHONY: clean
	rm */$(BUILD)
