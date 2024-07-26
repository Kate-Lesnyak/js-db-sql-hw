-- Вибрати детальну інформацію про фільм з ID 1
-- Shape
-- ID
-- Title
-- Release date
-- Duration
-- Description
-- Poster (poster file information in JSON format)
-- Director (person information in JSON format)
-- ID
-- First name
-- Last name
-- Photo (primary photo file information in JSON format)
-- Actors (array of JSON objects)
-- ID
-- First name
-- Last name
-- Photo (primary photo file information in JSON format)
-- Genres (array of objects in JSON format)
-- ID
-- Name

-- ! Я брала з бази данних фільм з id = 4, оскільки в процесі роботи були операції видалення та  id змінились. Під цим id фільм 'Bad Boys: Ride or Die'

WITH movie_info AS (
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
            'last_name', d.last_name,
            'photo', json_build_object(
                'id', pf.id,
                'file_name', pf.file_name,
                'mime_type', pf.mime_type,
                'key', pf.key,
                'url', pf.url
            )
        ) AS director
    FROM 
        movie m
    JOIN 
        person d ON m.director_id = d.id
    JOIN 
        file f ON m.poster_id = f.id
    LEFT JOIN 
        file pf ON d.primary_photo_id = pf.id
    WHERE 
        m.id = 4
),
actors AS (
    SELECT 
        c.movie_id,
        jsonb_agg(
            json_build_object(
                'id', p.id,
                'first_name', p.first_name,
                'last_name', p.last_name,
                'photo', json_build_object(
                    'id', af.id,
                    'file_name', af.file_name,
                    'mime_type', af.mime_type,
                    'key', af.key,
                    'url', af.url
                )
            )
        ) AS actor
    FROM 
        character c
    LEFT JOIN 
        person p ON c.person_id = p.id
    LEFT JOIN 
        file af ON p.primary_photo_id = af.id
    WHERE 
        c.movie_id = 4
    GROUP BY 
        c.movie_id
),
genres AS (
    SELECT 
        mg.movie_id,
        jsonb_agg(
            json_build_object(
                'id', g.id,
                'name', g.name
            )
        ) AS genre
    FROM 
        movie_genre mg
    JOIN 
        genre g ON mg.genre_id = g.id
    WHERE 
        mg.movie_id = 4
    GROUP BY 
        mg.movie_id
)
SELECT 
    mi.id,
    mi.title,
    mi.release_date,
    mi.duration,
    mi.description,
    mi.poster,
    mi.director,
    a.actor,
    g.genre
FROM 
    movie_info mi
LEFT JOIN 
    actors a ON mi.id = a.movie_id
LEFT JOIN 
    genres g ON mi.id = g.movie_id;