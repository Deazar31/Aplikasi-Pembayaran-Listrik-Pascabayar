-- Membuat database
CREATE DATABASE IF NOT EXISTS pln_db;
USE pln_db;

-- Tabel level
CREATE TABLE IF NOT EXISTS level (
  id_level INT AUTO_INCREMENT PRIMARY KEY,
  nama_level VARCHAR(50)
);

-- Tabel user
CREATE TABLE IF NOT EXISTS user (
  id_user INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50),
  password VARCHAR(100),
  id_level INT,
  nama VARCHAR(100),
  email VARCHAR(100),
  FOREIGN KEY (id_level) REFERENCES level(id_level)
);

-- Tabel pelanggan
CREATE TABLE IF NOT EXISTS pelanggan (
  id_pelanggan VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100),
  alamat TEXT,
  daya INT
);

-- Tabel penggunaan
CREATE TABLE IF NOT EXISTS penggunaan (
  id_penggunaan INT AUTO_INCREMENT PRIMARY KEY,
  id_pelanggan VARCHAR(10),
  bulan VARCHAR(20),
  tahun YEAR,
  meter_awal INT,
  meter_akhir INT,
  FOREIGN KEY (id_pelanggan) REFERENCES pelanggan(id_pelanggan)
);

-- Tabel tagihan
CREATE TABLE IF NOT EXISTS tagihan (
  id_tagihan INT AUTO_INCREMENT PRIMARY KEY,
  id_penggunaan INT,
  jumlah_tagihan INT,
  status ENUM('Belum Bayar', 'Lunas'),
  FOREIGN KEY (id_penggunaan) REFERENCES penggunaan(id_penggunaan)
);

-- Tabel tarif
CREATE TABLE IF NOT EXISTS tarif (
  daya INT PRIMARY KEY,
  tarif_per_kwh INT
);

-- Data awal level
INSERT INTO level (nama_level) VALUES ('admin'), ('pelanggan');

-- Data awal user admin (username: admin, password: admin123 di-hash MD5)
INSERT INTO user (username, password, id_level, nama, email) VALUES ('admin', MD5('admin123'), 1, 'Admin PLN', 'admin@email.com'); 