-- Задание: Определите, сколько в среднем очков получает пост каждого пользователя.
-- Сформируйте таблицу из следующих полей:
-- 1. Заголовок поста
-- 2. Идентификатор пользователя
-- 3. Число очков поста
-- 4. Среднее число очков пользователя за пост, округлённое до целого числа
-- Посты без заголовка и те, что набрали ноль очков, не учитываются.

-- Основной запрос для получения заголовка поста, идентификатора пользователя,
-- числа очков поста и среднего числа очков пользователя за пост
SELECT
    title,                                -- Заголовок поста
    user_id,                              -- Идентификатор пользователя
    score,                                -- Число очков поста
    ROUND(av) AS avg_score_per_post       -- Среднее число очков пользователя за пост, округлённое до целого числа
FROM (
    -- Подзапрос для расчета среднего числа очков пользователя за пост
    SELECT
        title,
        user_id,
        score,
        AVG(score) OVER (PARTITION BY user_id) AS av -- Среднее число очков пользователя за пост
    FROM stackoverflow.posts
    -- Фильтрация постов, у которых нет заголовка и постов с нулевыми очками
    WHERE title NOT LIKE '' 
      AND score != 0
) AS thd
