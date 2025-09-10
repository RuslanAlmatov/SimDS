-- WAU (weekly active users) – количество активных пользователей в неделю.

-- Вам предоставлен доступ к таблице default.churn_submits. В ней находятся данные по активности пользователей нашего Симулятора. Одна строка = одна попытка решения каким-то студентом какой-то задачи. 

-- churn_submits состоит из колонок: 

-- submit_id – id события-попытки
-- timestamp – время попытки
-- user_id  – id пользователя
-- task_id  – id задания
-- submit – номер попытки
-- score – балл за задание
-- is_solved – решил/не решил
-- Задание
-- 1. Напишите запрос с расчётом WAU за весь период скользящим окном в неделю с шагом в 1 день, при этом текущая дата должна включаться в расчет.
-- Например, для даты 07.09.2022 нужно рассчитать WAU за период с 01.09.2022 по 07.09.2022.

-- 2. Название столбцов должно быть day и wau. Столбы должны идти именно в таком порядке.

-- 3. Сохраните SQL-запрос в файл query.sql и загрузить его в форму ниже.

-- (также попробуйте вывести дашборд в Redash с полученной динамикой wau)

-- Для получения доступа к таблицам необходимо:

-- Зайти в инструменты через Redash.
-- Выбрать ClickHouse и найти в списке необходимые таблицы.


SELECT
    day,
    COUNT(DISTINCT user_id) AS wau
FROM (
    SELECT DISTINCT toDate(timestamp) AS day
    FROM default.churn_submits
) AS days
CROSS JOIN default.churn_submits AS cs
WHERE
    toDate(cs.timestamp) >= days.day - 6
    AND toDate(cs.timestamp) <= days.day
GROUP BY day
ORDER BY day;