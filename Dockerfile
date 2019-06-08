FROM python:3.7.4-slim

RUN apt-get update -y && apt-get install gnupg curl -y && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && apt-get update -y && apt-get upgrade -y && apt-get install -y \
    locales \
    google-cloud-sdk \
    && sed -i 's/^# *\(en_NZ.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install pipenv

ENV LANG="en_NZ.UTF-8"
ENV LC_ALL="en_NZ.UTF-8"