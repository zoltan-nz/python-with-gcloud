FROM python:3.9.6-slim

RUN apt-get update -y && apt-get install apt-transport-https ca-certificates gnupg2 curl software-properties-common apt-utils -y \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
    && apt-get update -y && apt-get upgrade -y && apt-get install -y \
    locales \
    google-cloud-sdk \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    gettext-base \
    kubectl \
    && sed -i 's/^# *\(en_NZ.UTF-8\)/\1/' /etc/locale.gen \
    && locale-gen \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && pip install pipenv

ENV LANG="en_NZ.UTF-8"
ENV LC_ALL="en_NZ.UTF-8"