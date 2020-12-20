IMAGES=ssh dev
REPO=ryanjohnson
BUILD=BUILD
DOCKER_FILES = $(addsuffix /Dockerfile, $(IMAGES))
BUILD_FILES = $(addsuffix /$(BUILD), $(IMAGES))

# Arguments
NO_CACHE?=false

.PHONY: all
all: $(BUILD_FILES)

dev/$(BUILD): ssh/$(BUILD)

$(BUILD_FILES): %/$(BUILD): %/Dockerfile
	docker build --no-cache=$(NO_CACHE) -t $(REPO)/$* -f $< $*
	date > $@

.PHONY: push
push: $(BUILD_FILES)
	$(patsubst %/$(BUILD),docker push $(REPO)/%;,$^)

.PHONY: clean
clean:
	rm */$(BUILD)
