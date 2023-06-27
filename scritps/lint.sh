#!/usr/bin/env bash
GIT_ROOT=$(git rev-parse --show-toplevel)

set -e

pushd "${GIT_ROOT}" > /dev/null


printf "Lint code helm lint \n" && \
helm lint . && \
printf "

SUCCESS=$?

popd > /dev/null

exit $SUCCESS