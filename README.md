# Debian slim image with Python and Google Cloud CLI for gitlab-runner

Build & push

```bash
$ docker login --username=zoltannz
$ docker build --rm -f "Dockerfile" -t zoltannz/python-with-gcloud:latest .
$ docker push zoltannz/python-with-gcloud:latest
```