#!/usr/bin/env bash
set -euo pipefail

# === Konfigurasi ===
DOCKER_USERNAME="${DOCKER_USERNAME:-<DOCKER_USERNAME>}"  # ganti default bila mau
IMAGE_NAME="${DOCKER_USERNAME}/karsajobs-ui:latest"

# Pastikan .env berisi VUE_APP_BACKEND=...
if ! grep -q '^VUE_APP_BACKEND=' .env; then
  echo "[ERROR] File .env belum di-set VUE_APP_BACKEND. Lihat instruksi langkah 2."
  exit 1
fi

# === Build image ===
# Dockerfile sudah disediakan oleh starter project frontend
echo "[INFO] Building image ${IMAGE_NAME} ..."
docker build -t "${IMAGE_NAME}" .

# === Login Docker Hub ===
if [[ -z "${PASSWORD_DOCKER_HUB:-}" ]]; then
  echo "[ERROR] Env PASSWORD_DOCKER_HUB belum diset"
  exit 1
fi
echo "${PASSWORD_DOCKER_HUB}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

# === Push image ===
echo "[INFO] Pushing image ${IMAGE_NAME} ..."
docker push "${IMAGE_NAME}"

echo "[SUCCESS] Done: ${IMAGE_NAME}"
