-- Задание: Найдите пользователя, который опубликовал больше всего постов за всё время с момента регистрации.
-- Выведите данные его активности за октябрь 2008 года:
-- 1. Номер недели.
-- 2. Дата и время последнего поста, опубликованного на этой неделе.

WITH top_user AS (
    -- Подзапрос для определения пользователя, который опубликовал больше всего постов
    SELECT user_id
    FROM stackoverflow.posts
    GROUP BY user_id
    ORDER BY COUNT(id) DESC
    LIMIT 1
),
october_posts AS (
    -- Подзапрос для выбора постов этого пользователя за октябрь 2008 года
    SELECT
        EXTRACT('week' FROM creation_date::date) AS week_number, -- Номер недели
        creation_date                                           -- Дата и время поста
    FROM stackoverflow.posts
    WHERE creation_date::date BETWEEN '2008-10-01' AND '2008-10-31'
    AND user_id = (SELECT user_id FROM top_user)               -- Выбираем посты только от топового пользователя
)
-- Основной запрос для получения последнего поста на каждой неделе
SELECT
    week_number,                                              -- Номер недели
    MAX(creation_date) AS last_post_date                    -- Дата и время последнего поста на этой неделе
FROM october_posts
GROUP BY week_number                                      -- Группируем по номеру недели
ORDER BY week_number;                                    -- Сортируем по номеру недели
