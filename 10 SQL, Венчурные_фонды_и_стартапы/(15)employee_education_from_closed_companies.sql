/* Составьте таблицу, куда войдут уникальные пары с номерами сотрудников из предыдущей задачи */
/* и учебным заведением, которое окончил сотрудник. */
WITH a1 AS (
  -- Создаём временную таблицу с уникальными названиями закрытых компаний,
  -- для которых первый раунд финансирования оказался последним
  SELECT DISTINCT name
  FROM company AS c
  WHERE status = 'closed'  -- Только закрытые компании
  AND c.id IN (
    -- Выбираем компании, которые участвовали как в первом, так и в последнем раунде
    SELECT company_id
    FROM funding_round
    WHERE is_first_round = 1 
    AND is_last_round = 1
  )
)

-- Основной запрос для получения уникальных пар с номерами сотрудников и их учебными заведениями
SELECT DISTINCT e.person_id AS unique,  -- Уникальный номер сотрудника
                e.instituition        -- Название учебного заведения
FROM education AS e
-- Фильтруем только тех сотрудников, которые работают в компаниях из временной таблицы a1
WHERE e.person_id IN (
    -- Получаем id сотрудников, работающих в компаниях из a1
    SELECT p.id
    FROM people AS p
    LEFT JOIN company AS c ON p.company_id = c.id
    WHERE c.name IN (SELECT name FROM a1)
);
