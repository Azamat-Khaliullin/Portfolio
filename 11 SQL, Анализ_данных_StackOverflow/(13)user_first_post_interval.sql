-- Задание: Для каждого пользователя, который написал хотя бы один пост, найдите интервал между регистрацией и временем создания первого поста.
-- Отобразите:
-- 1. Идентификатор пользователя
-- 2. Разницу во времени между регистрацией и первым постом

-- Подзапрос для получения минимальной даты создания поста для каждого пользователя
WITH first_post_dates AS (
    SELECT
        user_id AS dst,                     -- Идентификатор пользователя
        MIN(creation_date) AS min_dt       -- Дата первого поста пользователя
    FROM stackoverflow.posts
    GROUP BY user_id                       -- Группировка по идентификатору пользователя
)

-- Основной запрос для вычисления интервала между регистрацией и первым постом
SELECT
    us.id,                                  -- Идентификатор пользователя
    first_post_dates.min_dt - us.creation_date AS interval -- Разница во времени между регистрацией и первым постом
FROM first_post_dates
JOIN stackoverflow.users AS us
    ON us.id = first_post_dates.dst;       -- Соединение с таблицей пользователей по идентификатору пользователя
