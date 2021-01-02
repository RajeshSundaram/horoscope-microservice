build:
	docker build -t astro-service:latest .
start:
	docker rm --force astro-service
	docker run -it -d -p 80:8080 --name astro-service astro-service:latest
stop:
	docker container stop astro-service