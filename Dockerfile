# GitHub Action docker-based image
# Not intended for local development

FROM python:3.8.0-alpine3.10

LABEL maintainer="alwinrwang@outlook.com"

LABEL "com.github.actions.name"="GitHub Actions Lint Stage"
LABEL "com.github.actions.description"="GitHub Actions to run various linters and code formatters"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"

LABEL "com.github.actions.repository"="https://github.com/AlwinW/action-lint-python/"
LABEL "com.github.actions.homepage"="https://github.com/AlwinW/action-lint-python/"
LABEL "com.github.actions.maintainer"="AlwinW <16846521+AlwinW@users.noreply.github.com>"

COPY LICENSE README.md /
COPY requirements.txt /tmp/

RUN apk add --no-cache \
    gcc \
    musl-dev && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt