/*Написать крипт, добавляющий в БД vk, которую создали на занятии, 3 новые таблицы (с перечнем полей, указанием индексов и внешних ключей)*/

-- добавил в status пункт blocked
ALTER TABLE friend_requests MODIFY status ENUM('requested', 'approved', 'unfriended', 'declined', 'blocked')

-- создаю таблицу для черного списка (не уверен в правильности решения)
DROP TABLE IF EXISTS black_lists;
CREATE TABLE black_lists (
	id SERIAL,
	is_blocked ENUM('requested', 'approved', 'unfriended', 'declined', 'blocked'), -- или is_blocked ENUM('blocked') ???
	blocking_user_id BIGINT UNSIGNED DEFAULT NULL, --пользователь который блокирует
	blocked_user_id BIGINT UNSIGNED DEFAULT NULL, --пользователь которого блокируют
	
	CHECK (blocking_user_id != blocked_user_id),
	FOREIGN KEY (is_blocked) REFERENCES status(id),
	FOREIGN KEY (blocking_user_id) REFERENCES users(id),
	FOREIGN KEY (blocked_user_id) REFERENCES users(id)	
);


-- таблицы для списка аудио
DROP TABLE IF EXISTS audio_albums;
CREATE TABLE audio_albums(
	id SERIAL,
	name varchar(255) DEFAULT NULL,
    user_id BIGINT UNSIGNED DEFAULT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
  	PRIMARY KEY (id)
);

DROP TABLE IF EXISTS audios;
CREATE TABLE audios (
	id SERIAL,
	album_id BIGINT unsigned NULL,
	media_id BIGINT unsigned NOT NULL,

	FOREIGN KEY (album_id) REFERENCES audio_albums(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);
