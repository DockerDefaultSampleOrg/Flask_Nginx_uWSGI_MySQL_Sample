-- データベースとユーザーが存在する場合のみ削除
DROP DATABASE IF EXISTS app;
DROP USER IF EXISTS 'devuser'@'%';

-- ユーザーの作成
CREATE USER 'devuser'@'%' IDENTIFIED BY 'devpassword';

-- データベースの作成
CREATE DATABASE app;

-- データベースの選択
USE app;

-- ユーザーに権限を付与
GRANT ALL PRIVILEGES ON app.* TO 'devuser'@'%';

-- テーブルの作成
CREATE TABLE users (
    uid VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- サンプルデータの挿入
INSERT INTO users (uid, user_name, email, password) 
VALUES ('970af84c-dd40-47ff-af23-282b72b7cca8', 'サンプル', 'sample@gmail.com', '37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578');

-- 変更を確定
FLUSH PRIVILEGES;