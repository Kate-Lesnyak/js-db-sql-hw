-- Отримати список усіх користувачів разом із їхніми улюбленими фільмами у вигляді масиву ідентифікаторів
-- Shape
-- ID
-- Username
-- Favorite movie IDs

SELECT
    u.id,
    u.username,
    ARRAY_AGG(ufm.movie_id) AS favorite_movie_ids
FROM
    "user" u
LEFT JOIN
    user_favorite_movie ufm ON u.id = ufm.user_id
GROUP BY
    u.id;