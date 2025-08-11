# 📦 A433 - Microservices Item App

**Tech Stack:** ![Node.js](https://img.shields.io/badge/Node.js-14-green?logo=node.js) ![MongoDB](https://img.shields.io/badge/MongoDB-3-blue?logo=mongodb) ![Docker](https://img.shields.io/badge/Docker-Engine-blue?logo=docker) ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Orchestration-lightblue?logo=docker) ![Docker Hub](https://img.shields.io/badge/Docker%20Hub-Registry-blue?logo=docker)

Proyek ini adalah submission **Proyek Pertama: Deploy Item App dengan Docker Compose** dari kelas Dicoding.
Aplikasi ini terdiri dari service **MongoDB** dan service **Item App** berbasis Node.js, yang dideploy menggunakan **Docker Compose**.

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
├── link.txt              # Berisi URL deployment
├── log.txt               # Log hasil deployment
├── package.json
└── package-lock.json
```

---

## 🛠 Teknologi

* **Node.js** (versi 14-alpine)
* **MongoDB** (versi 3)
* **Docker** & **Docker Compose**
* **Docker Hub** sebagai Container Registry

---

## ⚙️ Persiapan

1. **Clone repository**

   ```bash
   git clone https://github.com/masdikaaa/a433-microservices.git
   cd a433-microservices
   ```

2. **Buat / edit file `.env`**

   ```env
   # Username Docker Hub
   DOCKERHUB_USERNAME=andikaferdialvianto

   # Tag image
   ITEM_APP_TAG=v1

   # Nama image lokal
   ITEM_APP_LOCAL=item-app

   # Versi MongoDB
   MONGO_VERSION=3
   ```

---

## 🚀 Menjalankan di Lokal

1. **Build & jalankan**

   ```bash
   docker compose up --build
   ```
2. Aplikasi akan tersedia di:

   ```
   http://localhost
   ```

---

## 📦 Build & Push Image ke Docker Hub

1. Login ke Docker Hub:

   ```bash
   docker login -u andikaferdialvianto
   ```

2. Jalankan script:

   ```bash
   chmod +x build_push_image.sh
   ./build_push_image.sh
   ```

3. Image akan tersedia di:

   ```
   https://hub.docker.com/r/andikaferdialvianto/item-app/tags
   ```

---

## ☁️ Deploy ke Server

1. **Build & push image** (dari lokal/dev machine)

   ```bash
   chmod +x build_push_image.sh
   ./build_push_image.sh
   ```

2. **Login Docker Hub** di server:

   ```bash
   docker login -u andikaferdialvianto
   ```

3. **Copy file** berikut ke server:

   * `.env`
   * `docker-compose.yml`

4. **Pull & jalankan container**:

   ```bash
   docker compose pull
   docker compose up -d
   ```

5. **Cek status container**:

   ```bash
   docker compose ps
   ```

6. **Simpan log deployment**:

   ```bash
   docker compose logs --no-color > log.txt
   ```

---

## 🔗 Link Deployment

Link aplikasi live: *(isi sesuai `link.txt`)*

---

## 📝 Catatan

* Pastikan `MONGO_VERSION=3` sesuai kriteria.
* Service `item-app` akan otomatis menunggu `item-db` siap sebelum berjalan (`depends_on` dengan healthcheck).
