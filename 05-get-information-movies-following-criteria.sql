-- Отримати інформацію про фільми, що відповідають наступним критеріям
-- Критерії
-- Належить до країни з ID 1
-- Випущені у 2022 році або пізніше
-- Тривалість більше 2 годин і 15 хвилин
-- Містить принаймні один з жанрів: Action або Drama.
-- Shape
-- ID
-- Title
-- Release date
-- Duration
-- Description
-- Poster (poster file information as JSON)
-- Director (director information as JSON)
-- ID
-- First name
-- Last name

-- ! Я брала з бази данних країну з id = 1. Під цим id це 'United States'

SELECT
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    json_build_object(
        'id', f.id,
        'file_name', f.file_name,
        'mime_type', f.mime_type,
        'key', f.key,
        'url', f.url
    ) AS poster,
    json_build_object(
        'id', d.id,
        'first_name', d.first_name,
        'last_name', d.last_name
    ) AS director
FROM
    movie m
JOIN
    file f ON m.poster_id = f.id
JOIN
    person d ON m.director_id = d.id
WHERE
    m.country_id = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > '2 hours 15 minutes'
    AND EXISTS (
        SELECT 1
        FROM movie_genre mg
        JOIN genre g ON mg.genre_id = g.id
        WHERE mg.movie_id = m.id
        AND g.name IN ('action', 'drama')
    );