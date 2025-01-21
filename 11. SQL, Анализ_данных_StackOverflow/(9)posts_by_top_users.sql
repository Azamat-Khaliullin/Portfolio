-- Задание: Отобразите заголовки постов, которые были написаны пользователями, получившими более 1000 значков.
-- Посты без заголовков не должны попасть в список.

-- Подзапрос для получения идентификаторов пользователей, получивших более 1000 значков
WITH top_users AS (
    SELECT user_id
    FROM (
        SELECT user_id,
               COUNT(id) AS badge_count
        FROM stackoverflow.badges
        GROUP BY user_id
    ) AS badge_counts
    WHERE badge_count > 1000
)

-- Основной запрос для получения заголовков постов, написанных пользователями из подзапроса
SELECT title
FROM stackoverflow.posts
-- Фильтрация постов, чтобы исключить те, у которых нет заголовка
WHERE title <> ''
-- Фильтрация постов, написанных пользователями из подзапроса
AND user_id IN (
    SELECT user_id
    FROM top_users
);
