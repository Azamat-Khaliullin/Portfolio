/* Отберите данные по месяцам с 2010 по 2013 год, когда проходили инвестиционные раунды. 
   Сгруппируйте данные по номеру месяца и получите таблицу, в которой будут поля:
   номер месяца, в котором проходили раунды;
   количество уникальных названий фондов из США, которые инвестировали в этом месяце;
   количество компаний, купленных за этот месяц;
   общая сумма сделок по покупкам в этом месяце. */

WITH
-- Подзапрос для получения данных о сделках по покупке компаний
a1 AS (
    SELECT EXTRACT(MONTH FROM acquired_at) AS month,  -- Номер месяца
           COUNT(acquired_company_id) AS companies,  -- Количество компаний, купленных в этом месяце
           SUM(price_amount) AS total_transaction_amount  -- Общая сумма сделок по покупкам
    FROM acquisition
    WHERE EXTRACT(YEAR FROM acquired_at) BETWEEN 2010 AND 2013  -- Ограничиваем годами с 2010 по 2013
    GROUP BY month  -- Группировка по месяцу
),
-- Подзапрос для получения данных о фондах, которые инвестировали в США
b1 AS (
    SELECT EXTRACT(MONTH FROM funded_at) AS month,  -- Номер месяца
           COUNT(DISTINCT fd.name) AS nmbr_funds  -- Количество уникальных фондов, инвестировавших в этом месяце (США)
    FROM funding_round AS fr
    LEFT JOIN investment AS it ON fr.id = it.funding_round_id  -- Соединяем с инвестициями
    LEFT JOIN fund AS fd ON it.fund_id = fd.id  -- Соединяем с фондами
    WHERE EXTRACT(YEAR FROM fr.funded_at) BETWEEN 2010 AND 2013  -- Ограничиваем годами с 2010 по 2013
    AND fd.country_code = 'USA'  -- Фонды из США
    GROUP BY month  -- Группировка по месяцу
)

-- Основной запрос для объединения данных о сделках по покупке и инвестициях
SELECT a1.month,  -- Номер месяца
       b1.nmbr_funds,  -- Количество уникальных фондов
       a1.companies,  -- Количество купленных компаний
       a1.total_transaction_amount  -- Общая сумма сделок по покупкам
FROM a1
JOIN b1 ON a1.month = b1.month;  -- Объединяем данные по месяцу
