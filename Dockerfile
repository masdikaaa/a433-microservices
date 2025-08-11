# ===============================
# Dockerfile untuk item-app
# ===============================

# (1) Gunakan base image Node.js versi 14 sesuai kriteria
FROM node:14-alpine

# (2) Tentukan direktori kerja di container
WORKDIR /app

# (3) Salin file manifest lebih dulu (optimasi cache build)
COPY package*.json ./

# (4) Salin seluruh source code project ke container
COPY . .

# (5) Set environment agar app berjalan dalam production mode
#     DB_HOST=item-db artinya koneksi ke service MongoDB bernama item-db
ENV NODE_ENV=production \
    DB_HOST=item-db

# (6) Install dependencies untuk production & build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# (7) Ekspos port yang digunakan aplikasi
EXPOSE 8080

# (8) Jalankan server ketika container start
CMD ["npm", "start"]
