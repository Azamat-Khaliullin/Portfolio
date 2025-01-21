/* Выведите на экран всю информацию о людях, */
/* у которых названия аккаунтов в поле network_username содержат подстроку 'money', */
/* а фамилия начинается на 'K'. */
SELECT *
FROM people
-- Фильтруем записи, где twitter_username содержит подстроку 'money'
WHERE twitter_username LIKE '%money%'
-- Фильтруем записи, где фамилия начинается с буквы 'K'
AND last_name LIKE 'K%';
