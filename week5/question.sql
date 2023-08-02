/*1*/
SELECT * FROM user_info;

/*2*/
SELECT * FROM user_info WHERE gender = 'Female';

/*3*/
SELECT * FROM user_info WHERE age <= 26 AND gender = 'Male';

/*4*/
SELECT * FROM user_info WHERE email LIKE '%.com' ORDER BY name DESC;

/*5*/
SELECT * FROM user_info WHERE id > 100 AND name LIKE '%e%' AND age > 40;

/*6*/
insert into user_info (name) values ('JeonSH');

/*7*/
UPDATE user_info
SET name = 'JSH', email = 'hello@gmail.com', gender = 'Male', age = 24
WHERE id = 94;

/*8*/
DELETE FROM user_info WHERE gender NOT IN ('Male', 'Female');
