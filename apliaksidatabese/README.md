# apliaksidatabese

🗂️ Aplikasi Database SQLite
Proyek Flutter sederhana untuk mengelola data menggunakan SQLite (sqflite) dengan menytimpan data nomor telepon dan nama.
Aplikasi ini menunjukkan implementasi CRUD (Create, Read, Update, Delete) dengan database lokal, cocok untuk belajar dasar integrasi database di Flutter.

🚀 Fitur
Tambah data baru ke database.

Lihat daftar data yang tersimpan.

Edit data yang sudah ada.

Hapus data dari database.

Database otomatis dibuat saat pertama kali aplikasi dijalankan.

📂 Struktur Proyek
Code
apliaksidatabese/
│── lib/
│   ├── main.dart          # Entry point aplikasi
│   ├── db_instance.dart   # Setup & koneksi SQLite
│   ├── data_model.dart    # Model data
│   ├── home_page.dart     # Tampilan daftar data
│   ├── add_edit_page.dart # Form tambah/edit data
│── pubspec.yaml           # Dependencies Flutter
│── README.md              # Dokumentasi proyek
⚙️ Instalasi
Clone repository:

bash
git clone https://github.com/kramalmr/databasesqlite.git
cd databasesqlite/apliaksidatabese
Install dependencies:

bash
flutter pub get
Jalankan aplikasi:

bash
flutter run
📦 Dependencies
sqflite – SQLite untuk Flutter

path_provider (pub.dev in Bing) – Lokasi penyimpanan database


![alt text](image.png)
