-- Задание: Выведите количество постов за 2008 год по месяцам.
-- Отберите посты от пользователей, которые зарегистрировались в сентябре 2008 года и сделали хотя бы один пост в декабре того же года.
-- Отсортируйте таблицу по значению месяца по убыванию.

SELECT
    DATE_TRUNC('month', pt.creation_date)::date AS month_start, -- Начало месяца, для группировки
    COUNT(pt.id) AS post_count                                -- Количество постов в месяце
FROM stackoverflow.users AS us
JOIN stackoverflow.posts AS pt ON us.id = pt.user_id         -- Объединение таблиц пользователей и постов
WHERE
    us.creation_date::date BETWEEN '2008-09-01' AND '2008-09-30'  -- Регистрация пользователей в сентябре 2008 года
    AND us.id IN (                                                -- Выбираем только тех пользователей, которые сделали посты в декабре 2008 года
        SELECT user_id
        FROM stackoverflow.posts
        WHERE creation_date BETWEEN '2008-12-01' AND '2008-12-31'
    )
    AND DATE_TRUNC('year', pt.creation_date)::date = '2008-01-01' -- Посты только за 2008 год
GROUP BY DATE_TRUNC('month', pt.creation_date)::date            -- Группировка по началу месяца
ORDER BY DATE_TRUNC('month', pt.creation_date)::date DESC;      -- Сортировка по началу месяца в порядке убывания
