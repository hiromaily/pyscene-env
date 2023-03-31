.PHONY:build
build:
	docker image build -t local-pyscene .

# issue
# https://stackoverflow.com/questions/55016899/appengine-warning-openblas-warning-could-not-determine-the-l2-cache-size-on
# e.g. make list video=pool.mov
.PHONY:list
list:
	docker run --rm -v $(CURDIR):/workspace --workdir /workspace local-pyscene:latest scenedetect -i $(video) time -s 10s detect-adaptive list-scenes

# e.g. make image video=pool.mov
.PHONY:image
image:
	docker run --rm -v $(CURDIR):/workspace --workdir /workspace local-pyscene:latest scenedetect -i $(video) -o images time -s 5s detect-adaptive save-images --png --quality 100 

.PHONY:help
help:
	docker run --rm local-pyscene:latest scenedetect help

.PHONY:clean
clean:
	rm -rf images/*.png
