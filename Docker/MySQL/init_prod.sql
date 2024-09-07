-- データベースとユーザーが存在する場合のみ削除
DROP DATABASE IF EXISTS app;
DROP USER IF EXISTS 'admin'@'%';

-- ユーザーの作成
CREATE USER 'admin'@'%' IDENTIFIED BY 'prodpassword';

-- データベースの作成
CREATE DATABASE app;

-- データベースの選択
USE app;

-- ユーザーに権限を付与
GRANT ALL PRIVILEGES ON app.* TO 'admin'@'%';

-- テーブルの作成
CREATE TABLE users (
    uid VARCHAR(255) PRIMARY KEY,
    user_name VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- サンプルデータの挿入
INSERT INTO users (uid, user_name, email, password) 
VALUES ('970af84c-dd40-47ff-af23-282b72b7cca8', '管理者', 'admin@gmail.com', '37268335dd6931045bdcdf92623ff819a64244b53d0e746d438797349d4da578');

-- 変更を確定
FLUSH PRIVILEGES;