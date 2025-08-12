#!/usr/bin/env bash
set -euo pipefail

# === Konfigurasi ===
DOCKER_USERNAME="${DOCKER_USERNAME:-<DOCKER_USERNAME>}"  # ganti default bila mau
IMAGE_NAME="${DOCKER_USERNAME}/karsajobs:latest"

# === Build image ===
# Pastikan ada Dockerfile di repo backend (disediakan starter project)
echo "[INFO] Building image ${IMAGE_NAME} ..."
docker build -t "${IMAGE_NAME}" .

# === Login Docker Hub ===
# Ekspor password terlebih dulu:
#   export PASSWORD_DOCKER_HUB='passwordmu'
if [[ -z "${PASSWORD_DOCKER_HUB:-}" ]]; then
  echo "[ERROR] Env PASSWORD_DOCKER_HUB belum diset"
  exit 1
fi
echo "${PASSWORD_DOCKER_HUB}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# === Push image ===
echo "[INFO] Pushing image ${IMAGE_NAME} ..."
docker push "${IMAGE_NAME}"

echo "[SUCCESS] Done: ${IMAGE_NAME}"
