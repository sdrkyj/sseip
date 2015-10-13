CREATE DATABASE sseip
  CHAR SET utf8
  COLLATE utf8_general_ci;

GRANT ALL ON sseip.* TO wa@localhost;

CREATE TABLE `group` (
  id          INT PRIMARY KEY AUTO_INCREMENT,
  name        VARCHAR(128),
  description TEXT(512)
);

CREATE TABLE user (
  id        INT PRIMARY KEY AUTO_INCREMENT,
  username  CHAR(64)  NOT NULL UNIQUE,
  password  TEXT(256) NOT NULL,
  real_name VARCHAR(64),
  age       INT(3),
  id_number CHAR(20),
  address   TEXT(512),
  phone     DECIMAL(32),
  added     DATETIME        DEFAULT current_timestamp,
  role      INT,
  group_id  INT,
  CONSTRAINT fk_user_group_id_group_id FOREIGN KEY (group_id) REFERENCES `group` (id)
);

CREATE TABLE customer (
  id                INT PRIMARY KEY AUTO_INCREMENT,
  name              VARCHAR(128),
  sex               TINYINT(1),
  age               INT,
  address           TEXT,
  symptom           TEXT,
  email             VARCHAR(254),
  tel               VARCHAR(32),
  website           SMALLINT,
  disease_type      SMALLINT,
  access_point_type SMALLINT,
  faraway           TINYINT(1)      DEFAULT FALSE,
  emergency         TINYINT(1)      DEFAULT FALSE,
  added             DATETIME        DEFAULT current_timestamp,
  user_id           INT,
  group_id          INT,
  CONSTRAINT fk_customer_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id),
  CONSTRAINT fk_customer_group_id_group_id FOREIGN KEY (group_id) REFERENCES `group` (id)
);

USE sseip;
DROP TABLE country;
CREATE TABLE country (
  id      INT PRIMARY KEY AUTO_INCREMENT,
  `name`  VARCHAR(64),
  memo    VARCHAR(128),
  updated DATETIME        DEFAULT current_timestamp,
  a2_code CHAR(4)
);

CREATE TABLE website (
  id   INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(64),
  url  VARCHAR(128)
);

CREATE TABLE disease_type (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(64)
);

CREATE TABLE access_point_type (
  id     INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(16)
);

CREATE TABLE user_role (
  id      INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,
  role    INT,
  CONSTRAINT fk_user_role_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id)
);

CREATE TABLE user_logon (
  id            INT PRIMARY KEY AUTO_INCREMENT,
  user_id       INT,
  last_sign_in  DATETIME        DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  last_mac_addr VARCHAR(6),
  last_ip       VARCHAR(39),
  CONSTRAINT fk_user_logon_user_id_user_id FOREIGN KEY (user_id) REFERENCES user (id)
);
