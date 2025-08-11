# 📦 A433 - Microservices Item App

![Node.js](https://img.shields.io/badge/Node.js-14-green?logo=node.js) ![MongoDB](https://img.shields.io/badge/MongoDB-3-blue?logo=mongodb) ![Docker](https://img.shields.io/badge/Docker-Engine-blue?logo=docker) ![Docker Compose](https://img.shields.io/badge/Docker%20Compose-Orchestration-lightblue?logo=docker) ![Docker Hub](https://img.shields.io/badge/Docker%20Hub-Registry-blue?logo=docker)

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

## 🚀 Build Image & Push ke Docker Hub (Wajib Sebelum Deploy)

1. Login ke Docker Hub:

   ```bash
   docker login -u andikaferdialvianto
   ```
2. Jalankan script build & push:

   ```bash
   chmod +x build_push_image.sh
   ./build_push_image.sh
   ```
3. Pastikan image tersedia di:

   ```
   https://hub.docker.com/r/andikaferdialvianto/item-app/tags
   ```

---

## 💻 Menjalankan di Lokal (Build Sekaligus Menjalankan)

```bash
docker compose up -d --build
```

Perintah ini akan membangun image dari Dockerfile dan langsung menjalankan container.
Akses aplikasi di `http://localhost`.

---

## ☁️ Deploy ke Server

1. **Build & push image** di lokal:

   ```bash
   chmod +x build_push_image.sh
   ./build_push_image.sh
   ```
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
