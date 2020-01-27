FROM python:3.8.0-alpine3.10

LABEL maintainer="alwinrwang@outlook.com"

LABEL "com.github.actions.name"="GitHub Actions Lint Stage"
LABEL "com.github.actions.description"="GitHub Actions to run various linters and code formatters"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="blue"

LABEL "com.github.actions.repository"="https://github.com/AlwinW/action-lint-python/"
LABEL "com.github.actions.homepage"="https://github.com/AlwinW/action-lint-python/"
LABEL "com.github.actions.maintainer"="AlwinW <16846521+AlwinW@users.noreply.github.com>"

COPY LICENSE README.md /
COPY requirements.txt /tmp/

RUN apk add --no-cache \
    curl \
    gcc \
    git \
    musl-dev
RUN pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt

RUN git clone https://github.com/AlwinW/actions-ci.git /tmp/actions-ci --depth 1 --quiet && \
    mkdir -p /src/utils && \ 
    cp -r /tmp/actions-ci/utils /src && \
    ls /src/utils
