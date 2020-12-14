/*Задание 1
Установите СУБД MySQL.
Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке*/

[client]
user=root
password=my_password

/*Задание 2
Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name.*/

-- создаю БД example
CREATE DATABASE IF NOT EXISTS example;

-- выбираю БД по умолчанию
USE example

-- создаю таблицу users
DROP TABLE IF EXISTS users;
CREATE TABLE users(
  id INT UNSIGNED,
  name VARCHAR(255) 
);

/*Задание 3
Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.*/

-- создаю дамп с помощью утилиты mysqldump
mysqldump example > example_dump.sql

-- создаю БД sample
CREATE DATABASE IF NOT EXISTS sample;

-- разворачиваю дамп в БД sample
mysql sample < example_dump.sql

