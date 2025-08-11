#!/usr/bin/env bash
set -euo pipefail

# Load variabel dari .env
source .env

IMAGE_LOCAL="${ITEM_APP_LOCAL}:${ITEM_APP_TAG}"
IMAGE_REMOTE="${DOCKERHUB_USERNAME}/${ITEM_APP_LOCAL}:${ITEM_APP_TAG}"

echo "[1/5] Build image lokal: ${IMAGE_LOCAL}"
docker build -t "${IMAGE_LOCAL}" .

echo "[2/5] Lihat daftar image lokal (filter ${ITEM_APP_LOCAL})"
docker images | grep -E "^${ITEM_APP_LOCAL}\s" || true

echo "[3/5] Tag image ke format Docker Hub: ${IMAGE_REMOTE}"
docker tag "${IMAGE_LOCAL}" "${IMAGE_REMOTE}"

echo "[4/5] Login ke Docker Hub"
if [[ -n "${PASSWORD_DOCKER_HUB:-}" ]]; then
  echo "${PASSWORD_DOCKER_HUB}" | docker login -u "${DOCKERHUB_USERNAME}" --password-stdin
else
  docker login -u "${DOCKERHUB_USERNAME}"
fi

echo "[5/5] Push image ke Docker Hub: ${IMAGE_REMOTE}"
docker push "${IMAGE_REMOTE}"

echo "Selesai. Image tersedia di: https://hub.docker.com/r/${DOCKERHUB_USERNAME}/${ITEM_APP_LOCAL}/tags"
