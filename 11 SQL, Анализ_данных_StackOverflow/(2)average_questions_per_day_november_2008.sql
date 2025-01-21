-- Задание: Определите среднее количество вопросов, задаваемых в день с 1 по 18 ноября 2008 года включительно.
-- Результат округлите до целого числа.

-- Подзапрос для подсчета количества вопросов, заданных в каждый день
WITH daily_counts AS (
    SELECT
        COUNT(id) AS cnt,                     -- Подсчет количества вопросов в день
        creation_date::date AS date          -- Приведение времени создания к типу DATE для группировки по дням
    FROM stackoverflow.posts
    WHERE post_type_id IN (
        -- Подзапрос для выбора идентификаторов вопросов из таблицы типов постов
        SELECT id
        FROM stackoverflow.post_types
        WHERE type = 'Question'
    )
    AND creation_date::date BETWEEN '2008-11-01' AND '2008-11-18' -- Фильтр по дате
    GROUP BY creation_date::date              -- Группировка по дате
)

-- Основной запрос для вычисления среднего количества вопросов в день
SELECT ROUND(AVG(cnt)) AS avg_questions_per_day
FROM daily_counts;
