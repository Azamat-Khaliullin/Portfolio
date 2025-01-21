-- Задание: Выведите общую сумму просмотров у постов, опубликованных в каждый месяц 2008 года.
-- Если данных за какой-либо месяц в базе нет, такой месяц можно пропустить.
-- Результат отсортируйте по убыванию общего количества просмотров.

SELECT
    DATE_TRUNC('month', creation_date::date)::date AS month,  -- Округляем дату создания поста до начала месяца
    SUM(views_count) AS total_views                           -- Суммируем количество просмотров постов за месяц
FROM stackoverflow.posts
WHERE EXTRACT('year' FROM creation_date::date) = 2008        -- Фильтруем посты только за 2008 год
GROUP BY DATE_TRUNC('month', creation_date::date)::date       -- Группируем результаты по месяцу
ORDER BY total_views DESC;                                    -- Сортируем по убыванию общего количества просмотров
