build:
	docker build  -f ./containerd/Dockerfile -t astro-service:latest .
start: stop
	docker run -it --rm -p 80:8080 --name astro-service -d astro-service:latest
stop:
	docker container stop astro-service || true && docker container rm astro-service || true