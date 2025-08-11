# 📦 A433 - Microservices Item App

**Tech Stack:** ![Node.js](https://img.shields.io/badge/Node.js-14-green?logo=node.js) ![MongoDB](https://img.shields.io/badge/MongoDB-3-blue?logo=mongodb) ![Docker](https://img.shields.io/badge/Docker-Engine-blue?logo=docker) ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Orchestration-lightblue?logo=docker) ![Docker Hub](https://img.shields.io/badge/Docker%20Hub-Registry-blue?logo=docker)

Proyek ini merupakan submission **Proyek Pertama: Deploy Item App dengan Docker Compose** dari kelas Dicoding. Aplikasi ini terdiri dari service **MongoDB** dan service **Item App** berbasis Node.js, yang dijalankan menggunakan **Docker Compose**.

---

## 📂 Struktur Project

```
.
├── app.js
├── bin/
├── public/
├── routes/
├── spec/
├── views/
├── Dockerfile
├── docker-compose.yml
├── build_push_image.sh
├── .env                  # Konfigurasi untuk build & deploy
├── link.txt              # URL deployment
├── log.txt               # Log hasil deployment
├── package.json
└── package-lock.json
```

---

## 🛠 Teknologi

* **Node.js** 14-alpine
* **MongoDB** 3
* **Docker** & **Docker Compose**
* **Docker Hub**

---

## ⚙️ Persiapan

1. **Clone repository**

   ```bash
   git clone https://github.com/masdikaaa/a433-microservices.git
   cd a433-microservices
   ```
2. **Buat / edit file `.env`**

   ```env
   DOCKERHUB_USERNAME=andikaferdialvianto
   ITEM_APP_TAG=v1
   ITEM_APP_LOCAL=item-app
   MONGO_VERSION=3
   ```

---

## 🚀 Menjalankan di Lokal

> **Penting:** `docker-compose.yml` menggunakan **image** (bukan `build:`), jadi kamu **harus build & tag/push image dulu** supaya Compose bisa menarik image yang benar.

**Opsi A — Rekomendasi (build & push dulu):**

```bash
chmod +x build_push_image.sh
./build_push_image.sh        # build lokal → tag → push ke Docker Hub

docker compose up -d         # server/lokal akan pull image dari Docker Hub
```

**Opsi B — Tanpa push (hanya lokal):**

```bash
# build image lokal dengan tag yang sama seperti di compose
chmod +x build_push_image.sh
source .env

docker build -t "${ITEM_APP_LOCAL}:${ITEM_APP_TAG}" .
# tag ke format yang dipakai di compose
docker tag "${ITEM_APP_LOCAL}:${ITEM_APP_TAG}" \
  "${DOCKERHUB_USERNAME}/${ITEM_APP_LOCAL}:${ITEM_APP_TAG}"

# jalankan tanpa perlu pull
docker compose up -d
```

Akses aplikasi di `http://localhost`.

---

## 📦 Build & Push Image ke Docker Hub

1. Login ke Docker Hub:

   ```bash
   docker login -u andikaferdialvianto
   ```
2. Jalankan script build & push:

   ```bash
   chmod +x build_push_image.sh
   ./build_push_image.sh
   ```
3. Lihat image di Docker Hub:

   ```
   https://hub.docker.com/r/andikaferdialvianto/item-app/tags
   ```

---

## ☁️ Deploy ke Server

1. **Pastikan sudah menjalankan** `build_push_image.sh` di lokal/dev machine.
2. **Login** di server:

   ```bash
   docker login -u andikaferdialvianto
   ```
3. **Copy file** `.env` & `docker-compose.yml` ke server.
4. **Pull & jalankan**:

   ```bash
   docker compose pull
   docker compose up -d
   ```
5. **Cek status**:

   ```bash
   docker compose ps
   ```
6. **Simpan log**:

   ```bash
   docker compose logs --no-color > log.txt
   ```

---

## 🔗 Link Deployment

Lihat di file `link.txt`.

---

## 📝 Catatan

* `MONGO_VERSION=3` wajib sesuai kriteria.
* `item-app` otomatis menunggu `item-db` sehat sebelum jalan (healthcheck + depends\_on).
