-- Задание 1
/* Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
 * который больше всех общался с выбранным пользователем (написал ему сообщений).*/

SELECT from_user_id , COUNT(*) AS total
FROM messages
WHERE to_user_id = 1
GROUP BY from_user_id
ORDER BY total DESC
LIMIT 1;

-- Задание 2
-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет

SELECT COUNT(*) AS total
FROM likes
WHERE media_id IN (
	SELECT id
	FROM media
	WHERE user_id IN (
		SELECT user_id 
		FROM profiles 
		WHERE birthday > (NOW() - INTERVAL 10 YEAR)
	)
);


-- Задание 3
-- Определить кто больше поставил лайков (всего): мужчины или женщины.

SELECT gender, COUNT(*)
FROM (
	SELECT 
		user_id AS liker, 
		(SELECT gender FROM profiles WHERE user_id = liker) AS gender
	FROM likes
) AS name
GROUP BY gender
ORDER BY COUNT(*) DESC;


