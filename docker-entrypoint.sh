#!/bin/bash

if [ -z ${GITHUB_RUNNER_TOKEN+x} ]; then
  echo "GH_RUNNER_TOKEN environment variable is not set"
  exit 1
fi

if [ -z ${GITHUB_REPOSITORY+x} ]; then
  echo "GH_REPOSITORY environment variable is not set."
  exit 1
fi

/github-runner/config.sh --url $GITHUB_REPOSITORY --token $GITHUB_RUNNER_TOKEN --labels $HOST,x64,linux --unattended
/github-runner/run.sh