CREATE DATABASE IF NOT EXISTS vehiculos_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'api_user'@'localhost' IDENTIFIED BY 'Vehiculos2026';
CREATE USER IF NOT EXISTS 'api_user'@'127.0.0.1' IDENTIFIED BY 'Vehiculos2026';
GRANT ALL PRIVILEGES ON vehiculos_db.* TO 'api_user'@'localhost';
GRANT ALL PRIVILEGES ON vehiculos_db.* TO 'api_user'@'127.0.0.1';
GRANT ALL PRIVILEGES ON test_vehiculos_db.* TO 'api_user'@'localhost';
FLUSH PRIVILEGES;
