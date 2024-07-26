-- Вибрати фільми, випущені за останні 5 років, з кількістю акторів, які з’явилися в кожному фільмі
-- Shape
-- ID
-- Title
-- Actors count

SELECT
    m.id,
    m.title,
    COUNT(c.person_id) AS actors_count
FROM
    movie m
JOIN
    character c ON m.id = c.movie_id
WHERE
    m.release_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY
    m.id;