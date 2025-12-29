#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM node:22.21.1-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    python3 \
    git \
    build-essential \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*