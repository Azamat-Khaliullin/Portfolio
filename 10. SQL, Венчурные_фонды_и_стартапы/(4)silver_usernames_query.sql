/* Отобразите имя, фамилию и названия аккаунтов людей в поле twitter_username, */
/* у которых названия аккаунтов начинаются на 'Silver'. */
SELECT first_name,
       last_name,
       twitter_username
FROM people
-- Фильтруем записи, где названия аккаунтов начинаются с 'Silver'
WHERE twitter_username LIKE 'Silver%';
