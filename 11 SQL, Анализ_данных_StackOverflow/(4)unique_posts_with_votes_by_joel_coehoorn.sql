-- Задание: Определите количество уникальных постов пользователя с именем Joel Coehoorn, которые получили хотя бы один голос.

-- Основной запрос для подсчета уникальных постов пользователя, которые получили голос
SELECT COUNT(DISTINCT pr.id) AS unique_posts_with_votes
FROM stackoverflow.posts AS pr
-- Фильтр по пользователю с именем 'Joel Coehoorn'
WHERE pr.user_id = (
    -- Подзапрос для получения идентификатора пользователя с именем 'Joel Coehoorn'
    SELECT id
    FROM stackoverflow.users
    WHERE display_name = 'Joel Coehoorn'
)
-- Условие для выбора постов, которые получили хотя бы один голос
AND pr.id IN (
    -- Подзапрос для получения идентификаторов постов, которые получили голос
    SELECT post_id
    FROM stackoverflow.votes
);
