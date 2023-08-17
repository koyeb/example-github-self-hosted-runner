FROM ubuntu:22.04

RUN apt update && apt install -y --no-install-recommends \
    ca-certificates \
    curl \
    libicu-dev \
    uuid-runtime \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /github-runner

RUN curl -o actions-runner-linux-x64-2.308.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.308.0/actions-runner-linux-x64-2.308.0.tar.gz
RUN tar xzf ./actions-runner-linux-x64-2.308.0.tar.gz

ENV RUNNER_ALLOW_RUNASROOT="1"

COPY docker-entrypoint.sh .

ENTRYPOINT ["./docker-entrypoint.sh"]