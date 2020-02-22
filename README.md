# Debian slim image with Python 3.8.2 and Google Cloud CLI for gitlab-runner

Build & push

```bash
$ docker login --username=zoltannz
$ docker build --rm -f "Dockerfile" -t zoltannz/python-with-gcloud:latest .
$ docker push zoltannz/python-with-gcloud:latest
```

Docker is also installed in this image. If you need Docker inside docker:

```
docker run -it -v /var/run/docker.sock:/var/run/docker.sock zoltannz/python-with-gcloud:latest /bin/bash
```