-- Вибрати режисерів разом із середнім бюджетом фільмів, які вони зняли
-- Shape
-- Director ID
-- Director name (concatenation of first and last names)
-- Average budget

SELECT
    p.id AS director_id,
    CONCAT(p.first_name, ' ', p.last_name) AS director_name,
    AVG(m.budget) AS average_budget
FROM
    person p
JOIN
    movie m ON p.id = m.director_id
GROUP BY
    p.id;