-- Задание: Определите количество уникальных пользователей, которые получили значки сразу в день регистрации.

-- Основной запрос для подсчета уникальных пользователей, получивших значки в день регистрации
SELECT COUNT(DISTINCT us.id) AS unique_users_with_badges_on_registration
FROM stackoverflow.users us
-- Соединение таблицы пользователей с таблицей значков по идентификатору пользователя
LEFT JOIN stackoverflow.badges bg ON bg.user_id = us.id
-- Фильтрация для случаев, когда дата регистрации пользователя совпадает с датой получения значка
WHERE us.creation_date::date = bg.creation_date::date;
