-- Задание: Выведите имена самых активных пользователей, которые в первый месяц после регистрации (включая день регистрации) дали больше 100 ответов.
-- Вопросы, которые задавали пользователи, не учитывайте.
-- Для каждого имени пользователя выведите количество уникальных значений user_id.
-- Отсортируйте результат по полю с именами в лексикографическом порядке.

SELECT
    display_name,                                                  -- Имя пользователя
    COUNT(DISTINCT pst.user_id) AS unique_user_count             -- Количество уникальных user_id
FROM stackoverflow.post_types AS pt
JOIN stackoverflow.posts AS pst ON pst.post_type_id = pt.id       -- Объединение таблиц постов и типов постов
JOIN stackoverflow.users AS us ON pst.user_id = us.id            -- Объединение таблиц пользователей и постов
WHERE
    pt.type = 'Answer'                                           -- Учитываем только посты типа "Ответ"
    AND DATE_TRUNC('day', pst.creation_date) >= DATE_TRUNC('day', us.creation_date)  -- Посты начиная с дня регистрации
    AND DATE_TRUNC('day', pst.creation_date) <= DATE_TRUNC('day', us.creation_date) + INTERVAL '1 month'  -- До одного месяца после регистрации
GROUP BY display_name                                             -- Группировка по имени пользователя
HAVING COUNT(pst.id) > 100                                      -- Учитываем только тех пользователей, которые сделали более 100 ответов
ORDER BY display_name;                                          -- Сортировка по имени пользователя в лексикографическом порядке
