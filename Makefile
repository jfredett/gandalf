build:
	docker build --tag jfredett/gandalf:latest .

run: build
	docker run -it --rm jfredett/gandalf:latest /bin/bash

run-debug: build
	docker run -it --rm --env DEBUG=1 jfredett/gandalf:latest /bin/bash

run-trace: build
	docker run -it --rm --env DEBUG=1 jfredett/gandalf:latest /bin/bash -x
