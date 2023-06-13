CREATE DATABASE lesson_dz4;
DROP DATABASE IF EXISTS lesson_4dz;
USE lesson_dz4;

-- 0. Cоздание базы данных

CREATE TABLE AUTO 
(  
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);

INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

-- 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA

SELECT 
	MARK,
	COLOR,
    	COUNT(1) AS "Количество машин каждого цвета для марок BMW и LADA"
FROM AUTO
WHERE MARK IN ("BMW", "LADA")
GROUP BY MARK, COLOR;

-- 2. Вывести на экран марку авто и количество AUTO не этой марки - ОТРИЦАНИЕ

SELECT
	COUNT(*) "Всего машин",
	SUM(MARK = "BMW") "количество AUTO марки BMW",
	SUM(MARK NOT IN("BMW")) AS "количество AUTO не этой марки"
FROM AUTO;

-- 3. Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT

CREATE TABLE test_a (
	id INT, 
    test varchar(10)
);

CREATE TABLE test_b (
	id INT
);

INSERT INTO test_a(id, test) VALUES
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');

INSERT INTO test_b(id) VALUES
(10),
(30),
(50);

SELECT t.id, t.test
FROM test_a t
LEFT JOIN test_b l 
ON t.id = l.id
WHERE l.id IS NULL;
